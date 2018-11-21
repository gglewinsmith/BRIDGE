class RegistrationsController < Devise::RegistrationsController
  protected

  # def create
  #   super do
  #     resource.applicant = params[:applicant]
  #     resource.save
  #   end
  # end

  def after_sign_up_path_for(resource)
    if (resource.applicant && resource.agecheck)
      return applicant_url
    elsif (resource.lender && resource.agecheck)
      return lender_url
    else
      root_path
    end
  end
end
