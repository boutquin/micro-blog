require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "#home is accessible by anyone" do
    # Make sure the user is not signed in
    assert_not_signed_in

    # Request the open home page
    get root_path

    # Assert that the user is able to access the home page
    assert_response :success
  end
end
