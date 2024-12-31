class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale, :set_menu

  private

  def set_locale
    I18n.locale = :ru
  end

  def set_menu
    @menu = MenuService::Menu.new(current_user, controller_name, action_name)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[username email password]
    )
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[username email password current_password first_name last_name]
    )
  end

  def render_turbo_stream_with_flash(response = nil)
    render turbo_stream: [
      response,
      turbo_stream.append(
        "flash", partial: "common/flash",
        locals: {
          type: flash[:type], message: flash[:message]
        }
      )
    ].compact
  end
end
