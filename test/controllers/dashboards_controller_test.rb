require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "#show is not accessible to anyone" do
    get dashboard_path

    assert_redirected_to sign_in_path
  end
end
