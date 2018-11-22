class LoansController < ApplicationController
  def index
    @loans = Loans.all.select { |loan| current_user == loan.user_id }
  end

  def create
    @fundraising_event = FundraisingEvent.find(params[:fundraising_event_id])
    #line below: here is where we define how much the loan is going to be
    #difference between an sku and an id: sku is just a description
    @loan = Loan.create!(
      funding_event_sku: @fundraising_event.course,
      amount_cents: params[:amount].to_i * 100,
      state: 'pending',
      user: current_user,
      fundraising_event_id: @fundraising_event.id
    )
    redirect_to new_fundraising_event_loan_payment_path(@fundraising_event, @loan)
  end

  def show
    @loan = current_user.loans.where(state: 'fulfilled').find(params[:id])
  end
end
