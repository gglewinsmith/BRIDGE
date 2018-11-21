class LoansController < ApplicationController
  def create
    fundraising_event = FundraisingEvent.find(params[:fundraising_event_id])
    loan = Loan.create!(funding_event_sku: fundraising_event.id, amount_cents: fundraising_event.price_cents, state: 'pending', user: current_user, fundraising_event_id: fundraising_event.id)


    redirect_to new_fundraising_event_loan_payment_path(fundraising_event, loan)
  end

  def show
    @loan = current_user.loans.where(state: 'paid').find(params[:id])
  end
end
