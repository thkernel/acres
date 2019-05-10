require 'test_helper'

class UserCommissionRateTrackersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_commission_rate_tracker = user_commission_rate_trackers(:one)
  end

  test "should get index" do
    get user_commission_rate_trackers_url
    assert_response :success
  end

  test "should get new" do
    get new_user_commission_rate_tracker_url
    assert_response :success
  end

  test "should create user_commission_rate_tracker" do
    assert_difference('UserCommissionRateTracker.count') do
      post user_commission_rate_trackers_url, params: { user_commission_rate_tracker: { new_rate: @user_commission_rate_tracker.new_rate, old_rate: @user_commission_rate_tracker.old_rate, start_date: @user_commission_rate_tracker.start_date, user_id: @user_commission_rate_tracker.user_id } }
    end

    assert_redirected_to user_commission_rate_tracker_url(UserCommissionRateTracker.last)
  end

  test "should show user_commission_rate_tracker" do
    get user_commission_rate_tracker_url(@user_commission_rate_tracker)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_commission_rate_tracker_url(@user_commission_rate_tracker)
    assert_response :success
  end

  test "should update user_commission_rate_tracker" do
    patch user_commission_rate_tracker_url(@user_commission_rate_tracker), params: { user_commission_rate_tracker: { new_rate: @user_commission_rate_tracker.new_rate, old_rate: @user_commission_rate_tracker.old_rate, start_date: @user_commission_rate_tracker.start_date, user_id: @user_commission_rate_tracker.user_id } }
    assert_redirected_to user_commission_rate_tracker_url(@user_commission_rate_tracker)
  end

  test "should destroy user_commission_rate_tracker" do
    assert_difference('UserCommissionRateTracker.count', -1) do
      delete user_commission_rate_tracker_url(@user_commission_rate_tracker)
    end

    assert_redirected_to user_commission_rate_trackers_url
  end
end
