class PaymentsController < ApplicationController
  before_action :set_loan

  def new
    set_repayment if params[:repayment_id].present?
  end

  def create
    if params[:repayment_id].present?
      @fundraising_event = FundraisingEvent.find(params[:fundraising_event_id])
      set_repayment
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )

      charge = Stripe::Charge.create(
        customer:     customer.id,   # You should store this customer id and re-use it.
        amount:       @repayment.amount_cents,
        description:  "Payment for teddy #{@repayment.fundraising_event_sku} for repayment #{@repayment.id}",
        currency:     @repayment.amount.currency
      )
      @fundraising_event.save
      @repayment.update(payment: charge.to_json, state: 'paid')
      redirect_to fundraising_event_loan_repayment_path(params[:fundraising_event_id], params[:loan_id], params[:repayment_id])
    else
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

      @loan.update(payment: charge.to_json)
      redirect_to fundraising_event_loan_path(params[:fundraising_event_id], params[:loan_id])
    end
    # rescue Stripe::CardError => e
    # flash[:alert] = e.message
    # redirect_to new_order_payment_path(@loan)
  end

  private

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end

  def set_repayment
    @repayment = Repayment.find(params[:repayment_id])
  end
end
