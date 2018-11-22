class PaymentsController < ApplicationController
  before_action :set_loan

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,  # You should store this customer id and re-use it.
      amount:       @loan.amount_cents,
      description:  "Payment for fundraising-event #{@loan.funding_event_sku} for loan #{@loan.id}",
      currency:     @loan.amount.currency
    )

    @loan.update(payment: charge.to_json, state: 'fulfilled')
    redirect_to fundraising_event_loan_path(params[:fundraising_event_id], params[:loan_id])

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end
end
