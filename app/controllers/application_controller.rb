class ApplicationController < ActionController::Base
  # include Pundit
  protect_from_forgery
  before_action :authenticate_user!

  # after_action :verify_authorized, except: :home, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :home, unless: :skip_pundit?

  before_action :configure_permitted_parameters, if: :devise_controller?

  # authorize @fundraising_event

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:applicant, :lender,
      :agecheck, :admin, :name, :motivation, :linkedin, :photo, :job,
      :industry, :reasons_for_funding])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(resource)
    if resource.applicant || resource.lender
      return dashboard_url
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if params[:sign_up]
    user = User.find(params[:user])
      if user.applicant?
        return lender_url
      elsif user.lender?
        return applicant_url
      end
    else
      return root_path
    end
  end

  # def default_url_options
  #   { host: "www.bridgeloans.website" || "localhost:3000" }
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
