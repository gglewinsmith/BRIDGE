class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:homepage, :applicant, :lender]

  def homepage
  end

  def dashboard
    if current_user.applicant?
      @loans = Loan.all.select { |loan| current_user == loan.fundraising_event.user }
      tally
    elsif current_user.lender?
      @loans = Loan.all.select { |loan| current_user == loan.user }
    end
  end

  def applicant
  end

  def lender
  end

  private

  def tally
    @fundraising_events = FundraisingEvent.where(user: current_user)
    @fundraising_events.each do |fundraising_event|
      @total = fundraising_event.price
      @loan = 0
      fundraising_event.loans.each do |loan|
        @loan += loan.amount
      end
    end
  end
end
