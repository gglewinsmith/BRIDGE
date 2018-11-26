class RepaymentsController < ApplicationController
  def new
    @repayment = Repayment.new
    @loan = Loan.find(params[:loan_id])
    @fundraising_event = FundraisingEvent.find(params[:fundraising_event_id])
  end

  def create
    @fundraising_event = FundraisingEvent.find(params[:fundraising_event_id])
    @loan = Loan.find(params[:loan_id])
    @repayment = Repayment.create!(
      fundraising_event_sku: @loan.funding_event_sku,
      amount_cents: params[:amount].to_i * 100,
      state: 'pending',
      user: current_user,
      fundraising_event_id: @fundraising_event.id,
      loan_id: @loan.id
    )

    redirect_to new_fundraising_event_loan_repayment_payment_path(@fundraising_event, @loan, @repayment)
  end

  def show
    @repayment = current_user.repayments.where(state: 'paid').find(params[:id])
  end
end
