class ContributionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @contribution = Contribution.new(contributions_params)
    @contribution.amount = Monetize.parse!(contributions_params[:amount])
    @contribution.user = current_user
    @contribution.state = 'pending'
    if @contribution.save
      redirect_to new_contribution_payment_path(@contribution)
    else
      get_performance_variables
      render "performances/show"
    end

    authorize @contribution
  end

  def show
    @contribution = current_user.sent_contributions.where(state: 'paid').find(params[:id])
    authorize @contribution
  end

  private

  def contributions_params
    params.require(:contribution).permit(:amount,:message, :artist_id)
  end

  def set_contribution_amount
    if params[:credit_card] != "Other"
      @contribution.amount = Monetize.parse!(params[:credit_card])
    else
      @contribution.amount = Monetize.parse!(contributions_params[:amount])
    end
  end

  def duration(performance)
    sec_in_hours = 60 * 60
    minutes = ((performance.end_time - performance.start_time)/60).to_i
    hours = ((performance.end_time - performance.start_time)/sec_in_hours).floor
    "#{hours > 0 ? "#{hours} hours" : ""}#{minutes > 0 ? " #{minutes} minutes." : ""}"
  end

  def playing_now?
    if DateTime.now > @performance.start_time && DateTime.now < @performance.end_time
      true
    else
      false
    end
  end

  def get_performance_variables
    @performance = Performance.find(params[:performance_id])
    @attendances = @performance.attendances

    @attendance = Attendance.new
    @markers = [{
        lat: @performance.latitude,
        lng: @performance.longitude
          }]
    @duration = duration(@performance)
    @playing_now = playing_now?
    @comments = @performance.comments
    @comment = Comment.new
  end
end
