class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :applicant, :lender]

  def home
  end

  def applicant
  end

  def lender
  end
end
