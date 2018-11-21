class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if (resource.applicant && resource.agecheck)
      return dashboard_url
    elsif (resource.lender && resource.agecheck)
      return dashboard_url
    else
      root_path
    end
  end
end
