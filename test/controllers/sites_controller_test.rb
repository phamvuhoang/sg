require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get sites_about_url
    assert_response :success
  end

end
