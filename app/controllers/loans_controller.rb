class LoansController < ApplicationController
  def create
    @fundraising_event = FundraisingEvent.find(params[:fundraising_event_id])
    @loan = Loan.create!(
      funding_event_sku: @fundraising_event.course,
      amount_cents: params[:amount].to_i * 100,
      state: 'pending',
      user: current_user,
      fundraising_event_id: @fundraising_event.id
    )
    @fundraising_event.amount_raised += @loan.amount
    @loan.amount_owed += @loan.amount * (1.003333 ** @fundraising_event.loan_length)
    @fundraising_event.amount_due += @loan.amount_owed
    @fundraising_event.amount_due = @loan.amount_owed
    @loan.loan_length = @fundraising_event.loan_length
    @loan.save
    @fundraising_event.save
    redirect_to new_fundraising_event_loan_payment_path(@fundraising_event, @loan)
  end

  def show
    @loan = current_user.loans.where(state: 'fulfilled').find(params[:id])
  end
end
