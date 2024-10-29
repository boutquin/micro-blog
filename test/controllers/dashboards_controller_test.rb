require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "#show is inaccessible without sign in" do
    # Make sure the user is not signed in
    assert_not_signed_in
    # Request the protected dashboard page
    get dashboard_path

    # Assert that the user is redirected to the sign-in page
    assert_redirected_to sign_in_path
  end

  test "#show is accessible to signed-in users" do
    # Sign in as a user
    sign_in users(:one)
    # Request the protected dashboard page
    get dashboard_path

    # Assert that the user is able to access the dashboard page
    assert_response :success
  end
end
