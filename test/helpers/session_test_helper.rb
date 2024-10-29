# test/helpers/session_test_helper.rb

module SessionTestHelper
  def sign_in(user)
    post sign_in_path, params: { user: { email_address: user.email_address, password: "password" } }
  end

  def assert_signed_in
    get authenticated_path
    assert_response :success
  end

  def assert_not_signed_in
    get authenticated_path
    assert_redirected_to sign_in_path
  end

  def authenticated_path
    dashboard_path
  end
end
