class LoansController < ApplicationController
  def create
    fundraising_event = FundraisingEvent.find(params[:fundraising_event_id])
    loan = Loan.create!(funding_event_sku: fundraising_event.id, amount_cents: fundraising_event.price_cents, state: 'pending', user: current_user)

    redirect_to new_loan_payment_path(loan)
  end

  def show
    @loan = current_user.loans.where(state: 'paid').find(params[:id])
  end
end
