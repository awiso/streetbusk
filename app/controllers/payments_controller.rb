class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contribution

  def new
    authorize @contribution
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @contribution.amount_cents,
    description:  "Payment for artist #{@contribution.artist_id} for order #{@contribution.id}",
    currency:     @contribution.amount.currency
  )
  authorize @contribution
  @contribution.update(payment: charge.to_json, state: 'paid')
  # email! 
  @recipient = @contribution.artist
  @donor = @contribution.user
  @amount = @contribution.amount_cents
  @message = @contribution.message
  ContributionMailer.contribute(@recipient, @donor, @amount, @message).deliver_now

  redirect_to contribution_path(@contribution)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_contribution_payment_path(@contribution)
  end

  private

  def set_contribution
    @contribution = current_user.sent_contributions.where(state: 'pending').find(params[:contribution_id])
  end

end
