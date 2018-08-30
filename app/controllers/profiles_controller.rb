class ProfilesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :edit ]

  def show
    @user = User.find(params[:id])
    @performances = @user.performances
    @playing_now = playing_now?
    @social_media_links = get_social_media_array
    @contribution = Contribution.new
    if @performances.length > 0
      @performance = @performances.last
    else
      @performance = Performance.new(id: Performance.last.id)
    end
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    @social_media_links = @user.social_media_links.split("$%$")
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    @user.social_media_links = params_social_media_links
    if @user.save
      redirect_to profile_path(@user)
    else
      render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:soundcloud, :youtube, :avatar, :email, :artist_name, :default_performance_photo, :artist_description, :social_media_links)
  end

  def playing_now?
    if DateTime.now > @performances.last.start_time && DateTime.now < @performances.last.end_time
      true
    else
      false
    end
  end

  def params_social_media_links
    social_media = params.require(:social_media).permit(:yt, :in, :tw, :fb)
    social_media_links = []
    social_media.each do |l|
      social_media_links << l[1]
    end
    social_media_links.join("$%$")
  end

  def get_social_media_array
    if @user.social_media_links
      return @user.social_media_links.split("$%$")
    else
      return nil
    end
  end

end
