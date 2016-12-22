require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get favorites_search_url
    assert_response :success
  end

  test "should get edit" do
    get favorites_edit_url
    assert_response :success
  end

end
