class ProfilesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :edit ]

  def show
    @user = User.find(params[:id])
    @performances = @user.performances
    authorize @user
  end

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
    params.require(:user).permit(:social_media_links, :avatar, :email, :artist_name, :default_performance_photo)
  end
end
