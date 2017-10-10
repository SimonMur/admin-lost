require 'test_helper'

class SelectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get selects_new_url
    assert_response :success
  end

end
