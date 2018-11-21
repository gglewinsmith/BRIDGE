class ApplicationController < ActionController::Base
  # include Pundit
  protect_from_forgery
  before_action :authenticate_user!

  # after_action :verify_authorized, except: :home, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :home, unless: :skip_pundit?

  before_action :configure_permitted_parameters, if: :devise_controller?

  # authorize @fundraising_event

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :linkedin, :applicant, :lender, :photo, :agecheck])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(resource)
    if resource.applicant || resource.lender
      return dashboard_url
    else
      root_path
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
