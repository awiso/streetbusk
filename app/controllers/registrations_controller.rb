class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :artist, :avatar, :artist_name)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
