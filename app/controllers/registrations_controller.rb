class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)
    if @user.save
      redirect_to performances_path
    else
      render :new
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :artist, :avatar, :artist_name)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
