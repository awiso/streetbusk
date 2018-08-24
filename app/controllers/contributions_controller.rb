class ContributionsController < ApplicationController
  before_action :authenticate_user!

  def create
    # @performance = Performance.find(params[:performance_id])
    # @contribution = Contribution.new(contributions_params)
    @contribution = Contribution.new(contributions_params)
    set_contribution_amount
    @contribution.user = current_user
    @contribution.state = 'pending'
    authorize @contribution
  #  if @contribution.save
      redirect_to new_contribution_payment_path(@contribution)
    # else
    #   render performance_path(Performance.find(params(:id)))
    # end

    def show
      @contribution = current_user.sent_contributions.where(state: 'paid').find(params[:id])
      authorize @contribution
    end

  end

  private

  def contributions_params
    params.require(:contribution).permit(:amount, :artist_id, :credit)
  end

  def set_contribution_amount
    if params[:credit_card] != "Other"
      @contribution.amount = Monetize.parse!(params[:credit_card])
    else
      @contribution.amount = Monetize.parse!(contributions_params[:amount])
    end
  end
end
