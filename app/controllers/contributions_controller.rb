class ContributionsController < ApplicationController
  before_action :authenticate_user!

  def create

    @contribution = Contribution.new(contributions_params)
    @contribution.user = current_user
    set_contribution_amount
    @contribution.state = 'pending'
    @contribution.save
    authorize @contribution
    redirect_to new_contribution_payment_path(@contribution)

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
