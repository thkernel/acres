require 'test_helper'

class CommissionPercentageEditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commission_percentage_edit = commission_percentage_edits(:one)
  end

  test "should get index" do
    get commission_percentage_edits_url
    assert_response :success
  end

  test "should get new" do
    get new_commission_percentage_edit_url
    assert_response :success
  end

  test "should create commission_percentage_edit" do
    assert_difference('CommissionPercentageEdit.count') do
      post commission_percentage_edits_url, params: { commission_percentage_edit: { date_effet: @commission_percentage_edit.date_effet } }
    end

    assert_redirected_to commission_percentage_edit_url(CommissionPercentageEdit.last)
  end

  test "should show commission_percentage_edit" do
    get commission_percentage_edit_url(@commission_percentage_edit)
    assert_response :success
  end

  test "should get edit" do
    get edit_commission_percentage_edit_url(@commission_percentage_edit)
    assert_response :success
  end

  test "should update commission_percentage_edit" do
    patch commission_percentage_edit_url(@commission_percentage_edit), params: { commission_percentage_edit: { date_effet: @commission_percentage_edit.date_effet } }
    assert_redirected_to commission_percentage_edit_url(@commission_percentage_edit)
  end

  test "should destroy commission_percentage_edit" do
    assert_difference('CommissionPercentageEdit.count', -1) do
      delete commission_percentage_edit_url(@commission_percentage_edit)
    end

    assert_redirected_to commission_percentage_edits_url
  end
end
