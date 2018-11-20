class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :applicant, :lender]

  def homepage
  end

  def applicant
  end

  def lender
  end
end
