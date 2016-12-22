require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get aboutus" do
    get about_aboutus_url
    assert_response :success
  end

end
