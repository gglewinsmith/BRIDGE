# class UsersController < ApplicationController
#   def edit_applicant
#     @applicant = current_user
#     # authorize @applicant
#   end

#   def edit_lender
#     @lender = current_user
#     # authorize @lender
#   end

#   def update_applicant
#     current_user.update(applicant_params)
#     redirect_to dashboard_path
#   end

#   def update_lender
#     current_user.update(lender_params)
#     redirect_to dashboard_path
#   end

#   private

#   def applicant_params
#     params.require(:user).permit(:reasons_for_funding)
#   end

#   def lender_params
#     params.require(:user).permit(:job, :industry)
#   end
# end
