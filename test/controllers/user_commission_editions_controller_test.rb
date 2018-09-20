require 'test_helper'

class UserCommissionEditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_commission_edition = user_commission_editions(:one)
  end

  test "should get index" do
    get user_commission_editions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_commission_edition_url
    assert_response :success
  end

  test "should create user_commission_edition" do
    assert_difference('UserCommissionEdition.count') do
      post user_commission_editions_url, params: { user_commission_edition: { completed: @user_commission_edition.completed, date_effet: @user_commission_edition.date_effet } }
    end

    assert_redirected_to user_commission_edition_url(UserCommissionEdition.last)
  end

  test "should show user_commission_edition" do
    get user_commission_edition_url(@user_commission_edition)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_commission_edition_url(@user_commission_edition)
    assert_response :success
  end

  test "should update user_commission_edition" do
    patch user_commission_edition_url(@user_commission_edition), params: { user_commission_edition: { completed: @user_commission_edition.completed, date_effet: @user_commission_edition.date_effet } }
    assert_redirected_to user_commission_edition_url(@user_commission_edition)
  end

  test "should destroy user_commission_edition" do
    assert_difference('UserCommissionEdition.count', -1) do
      delete user_commission_edition_url(@user_commission_edition)
    end

    assert_redirected_to user_commission_editions_url
  end
end
