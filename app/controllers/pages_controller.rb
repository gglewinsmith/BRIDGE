class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:homepage, :applicant, :lender]

  def homepage
  end

  def dashboard
    if current_user.applicant?
      @loans = Loan.all.select { |loan| current_user == loan.fundraising_event.user }
      @fundraising_events = FundraisingEvent.where(user: current_user)
    elsif current_user.lender?
      @loans = Loan.all.select { |loan| current_user == loan.user }
      @fundraising_events = FundraisingEvent.all
    end
  end

  def applicant
  end

  def lender
  end
end
