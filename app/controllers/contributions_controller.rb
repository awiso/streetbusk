class ContributionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @performance = Performance.find(params[:performance_id])
    @contribution = Contribution.new(amount: @amount, user: @user, artist: @artist)
    @contribution.amount = params[:amount][:post]
    @contribution.artist = @performance.user
    @contribution.user = current_user
    @contribution.state = 'pending'
    authorize @contribution
    if @contribution.save
      redirect_to performances_path
    else
      render 'performances/show'
    end
  end

  private

  def contributions_params
    params.require(:contribution).permit(:amount, :user, :artist, :state)
  end

end
