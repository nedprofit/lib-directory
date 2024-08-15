class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash.now[:success] = t(:label_update_settings_suсcess)
      render_turbo_stream_with_flash

      respond_to do |format|
        format.html { redirect_to settings_profile_path }
        format.turbo_stream
      end
    else
      flash.now[:error] = t(:label_update_settings_failed)
      render_turbo_stream_with_flash
    end
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.destroy
      redirect_to root_path, notice: 'Ваш аккаунт успешно удален.'
    else
      redirect_to settings_account_path, alert: 'Произошла ошибка при удалении аккаунта.'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :avatar, :background,
                                 :first_name, :last_name)
  end
end
