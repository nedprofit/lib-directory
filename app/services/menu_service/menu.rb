require_relative "menu_item"

module MenuService
  # Служба меню отвечает за создание пунктов меню для пользовательского интерфейса на основе разрешений пользователя
  # и текущего контроллера с действием.
  class Menu
    MENU_ITEMS_PATH = Rails.root.join("config", "menu_items.yml").freeze

    # Инициализация службы меню.
    #
    # @param user [User] текущий пользователь
    # @param controller_name [String] имя текущего контроллера
    # @param action_name [String] имя текущего действия
    def initialize(user, controller_name, action_name)
      @accessible_elements = build_menu_items(user, controller_name, action_name).select(&:accessible?)
    end

    def general
      group_elements(@accessible_elements, "general")
    end

    def admin
      group_elements(@accessible_elements, "admin")
    end

    private

    # Построение структуры меню на основе конфигурации.
    #
    # @param user [User] текущий пользователь, для которого строится меню
    # @param controller_name [String] имя контроллера, в котором используется меню
    # @param action_name [String] имя действия в контроллере
    # @return [Array<MenuItem>] массив элементов меню
    # :reek:UtilityFunction
    def build_menu_items(user, controller_name, action_name)
      menu_items = YAML.load_file(MENU_ITEMS_PATH)["menu_items"]

      menu_items.map do |item_data|
        MenuItem.new(item_data, user, controller_name, action_name)
      end
    end

    # Группировка элементов меню по имени группы.
    #
    # @param elements [Array<MenuItem>] элементы меню
    # @param group_name [String] имя группы
    # @return [Array<MenuItem>] сгруппированные элементы меню
    # :reek:UtilityFunction
    def group_elements(elements, group_name)
      elements.group_by { |element| element.group.to_s }[group_name] || []
    end
  end
end
