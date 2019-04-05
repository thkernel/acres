require 'test_helper'

class BankCommissionRateTrackersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_commission_rate_tracker = bank_commission_rate_trackers(:one)
  end

  test "should get index" do
    get bank_commission_rate_trackers_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_commission_rate_tracker_url
    assert_response :success
  end

  test "should create bank_commission_rate_tracker" do
    assert_difference('BankCommissionRateTracker.count') do
      post bank_commission_rate_trackers_url, params: { bank_commission_rate_tracker: { bank_id: @bank_commission_rate_tracker.bank_id, date_effet: @bank_commission_rate_tracker.date_effet, new_rate: @bank_commission_rate_tracker.new_rate, old_rate: @bank_commission_rate_tracker.old_rate, status: @bank_commission_rate_tracker.status, user_id: @bank_commission_rate_tracker.user_id } }
    end

    assert_redirected_to bank_commission_rate_tracker_url(BankCommissionRateTracker.last)
  end

  test "should show bank_commission_rate_tracker" do
    get bank_commission_rate_tracker_url(@bank_commission_rate_tracker)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_commission_rate_tracker_url(@bank_commission_rate_tracker)
    assert_response :success
  end

  test "should update bank_commission_rate_tracker" do
    patch bank_commission_rate_tracker_url(@bank_commission_rate_tracker), params: { bank_commission_rate_tracker: { bank_id: @bank_commission_rate_tracker.bank_id, date_effet: @bank_commission_rate_tracker.date_effet, new_rate: @bank_commission_rate_tracker.new_rate, old_rate: @bank_commission_rate_tracker.old_rate, status: @bank_commission_rate_tracker.status, user_id: @bank_commission_rate_tracker.user_id } }
    assert_redirected_to bank_commission_rate_tracker_url(@bank_commission_rate_tracker)
  end

  test "should destroy bank_commission_rate_tracker" do
    assert_difference('BankCommissionRateTracker.count', -1) do
      delete bank_commission_rate_tracker_url(@bank_commission_rate_tracker)
    end

    assert_redirected_to bank_commission_rate_trackers_url
  end
end
