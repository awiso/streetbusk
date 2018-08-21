class ProfilesController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = User.update(user_params)
    if @user.save
      redirect_to profile_path(@user)
    else
      render :edit
    end
  end
end
