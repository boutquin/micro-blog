require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "#new is successful when not signed in" do
    # Make sure the user is not signed in
    assert_not_signed_in

    # Request the open sign-up page
    get sign_up_path

    # Assert that the user is able to access the sign-up page
    assert_response :success
  end
end
