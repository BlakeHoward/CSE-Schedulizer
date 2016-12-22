require 'test_helper'

class DegreeRequirmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get find" do
    get degree_requirments_find_url
    assert_response :success
  end

end
