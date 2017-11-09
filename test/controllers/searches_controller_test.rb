require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get searches_search_url
    assert_response :success
  end

  test "should get found" do
    get searches_found_url
    assert_response :success
  end

  test "should get lost" do
    get searches_lost_url
    assert_response :success
  end

end
