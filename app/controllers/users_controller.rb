class UsersController < ApplicationController
  def edit_applicant
    @applicant = current_user
    # authorize @applicant
  end

  def edit_lender
    @lender = current_user
    # authorize @lender
  end

  def update_applicant
    current_user.update(applicant_params)
  end

  def update_lender
    current_user.update(lender_params)
  end

  private

  def applicant_params
  end

  def lender_params
    params.require(:user).permit(:job, :industry)
  end
end
