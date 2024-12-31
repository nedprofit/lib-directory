module MenuService
  # Объект, представляющий пункт меню.
  # :reek:InstanceVariableAssumption
  # :reek:TooManyInstanceVariables
  class MenuItem
    include Rails.application.routes.url_helpers

    attr_reader :name, :path, :icon, :controller,
                :action, :active, :group

    # Инициализация пункта меню.
    #
    # @param item_data [Hash] данные пункта меню из конфигурации
    # @param user [User] текущий пользователь
    # @param current_controller [String] имя текущего контроллера
    # @param current_action [String] имя текущего действия
    def initialize(item_data, user, current_controller, current_action)
      @item_data = item_data
      @user = user
      @current_controller = current_controller
      @current_action = current_action

      set_attributes
    end

    # Проверка доступности пункта меню для пользователя.
    #
    # @return [Boolean] true, если пункт доступен, иначе false
    #
    # @example
    #   item.accessible? # => true
    def accessible?
      policy_record = @item_data["policy"]
      action_name = @item_data["action"] || :index

      Pundit.policy(@user, policy_record)&.public_send("#{action_name}?")
    rescue Pundit::NotDefinedError, NoMethodError => exception
      Rails.logger.error I18n.t(
        "menu_items.errors.policy_not_defined",
        record: policy_record,
        error_message: exception.message
      )
      false
    end

    private

    # Заполнение атрибутов класса на основе данных пункта меню.
    def set_attributes
      @name = fetch_name
      @path = fetch_path
      @icon = @item_data["icon"]
      @controller = @item_data["controller"]
      @action = @item_data["action"]
      @active = determine_active
      @group = @item_data["group"]
    end

    # Получение названия пункта меню.
    #
    # @return [String] локализованное название пункта меню
    def fetch_name
      I18n.t("menu.items.#{@item_data['i18_key']}")
    end

    # Получение пути к пункту меню.
    #
    # @return [String, nil] URL путь или nil, если путь некорректен
    def fetch_path
      send(@item_data["path_helper"])
    rescue NoMethodError, ArgumentError => exception
      Rails.logger.error I18n.t(
        "menu_items.errors.incorrect_path_helper",
        path_helper: @item_data["path_helper"],
        error_message: exception.message
      )
      nil
    end

    # Определение, является ли пункт меню активным.
    #
    # @return [Boolean] true, если пункт активен, иначе false
    def determine_active
      controllers = Array(@item_data["controller"]).map(&:to_s)

      is_controller_active = controllers.include?(@current_controller.to_s)

      if @item_data["action"]
        is_controller_active && (@current_action.to_s == @item_data["action"].to_s)
      else
        is_controller_active
      end
    end
  end
end
