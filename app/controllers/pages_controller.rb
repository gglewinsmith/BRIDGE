class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:homepage, :applicant, :lender]

  def homepage

  end

  def dashboard
    @fundraising_events = FundraisingEvent.where(user: current_user)
  end

end
