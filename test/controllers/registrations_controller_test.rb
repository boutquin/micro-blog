require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "#new" do
    get sign_in_path

    assert_response :success
  end
end
