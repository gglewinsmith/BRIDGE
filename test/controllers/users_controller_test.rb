require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new_applicant" do
    get users_new_applicant_url
    assert_response :success
  end

  test "should get new_lender" do
    get users_new_lender_url
    assert_response :success
  end

end
