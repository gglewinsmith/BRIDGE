class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:homepage, :applicant, :lender]

  def homepage
  end

  def dashboard
  end

end
