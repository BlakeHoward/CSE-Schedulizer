require 'test_helper'

class PastCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get past_courses_edit_url
    assert_response :success
  end

end
