require 'test_helper'

class LostitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lostitem = lostitems(:one)
  end

  test "should get index" do
    get lostitems_url
    assert_response :success
  end

  test "should get new" do
    get new_lostitem_url
    assert_response :success
  end

  test "should create lostitem" do
    assert_difference('Lostitem.count') do
      post lostitems_url, params: { lostitem: { county_id: @lostitem.county_id, date_found: @lostitem.date_found, date_of_birth: @lostitem.date_of_birth, description: @lostitem.description, id_number: @lostitem.id_number, location: @lostitem.location, name: @lostitem.name, other_number: @lostitem.other_number, pp_number: @lostitem.pp_number, reg_number: @lostitem.reg_number, type_id: @lostitem.type_id, user_id: @lostitem.user_id } }
    end

    assert_redirected_to lostitem_url(Lostitem.last)
  end

  test "should show lostitem" do
    get lostitem_url(@lostitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_lostitem_url(@lostitem)
    assert_response :success
  end

  test "should update lostitem" do
    patch lostitem_url(@lostitem), params: { lostitem: { county_id: @lostitem.county_id, date_found: @lostitem.date_found, date_of_birth: @lostitem.date_of_birth, description: @lostitem.description, id_number: @lostitem.id_number, location: @lostitem.location, name: @lostitem.name, other_number: @lostitem.other_number, pp_number: @lostitem.pp_number, reg_number: @lostitem.reg_number, type_id: @lostitem.type_id, user_id: @lostitem.user_id } }
    assert_redirected_to lostitem_url(@lostitem)
  end

  test "should destroy lostitem" do
    assert_difference('Lostitem.count', -1) do
      delete lostitem_url(@lostitem)
    end

    assert_redirected_to lostitems_url
  end
end
