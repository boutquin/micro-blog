# test/controllers/sessions_controller_test.rb

require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "#new is successful when not signed in" do
    # Make sure the user is not signed in
    assert_not_signed_in

    # Request the open sign-in page
    get sign_in_path

    # Assert that the user is able to access the sign-in page
    assert_response :success
  end

  test "#create signs in the user when not signed in" do
    assert_not_signed_in
    sign_in users(:one)
    assert_redirected_to dashboard_path
    assert_signed_in
  end

  test "#destroy signs out the user" do
    sign_in users(:one)
    assert_signed_in
    assert_difference("Session.count", -1) { delete session_path }
    assert_redirected_to root_path
    assert_not_signed_in
  end

  test "#destroy redirects when not signed in" do
    delete sign_out_path
    assert_redirected_to sign_in_path
  end
end
