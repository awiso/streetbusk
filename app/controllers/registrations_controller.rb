class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)
    if @user.save
      sign_in_and_redirect after_sign_in_path_for(@user)
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

  def after_sign_in_path_for(resource)
      session[:previous_url] || performances_path
  end
end
