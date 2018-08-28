class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    if @user.save
      redirect_to profile_path(@user)
    else
      render :edit
    end
  end

  private 

  def user_params
    params.require(:user).permit(:avatar, :social_media_links)
  end
end

