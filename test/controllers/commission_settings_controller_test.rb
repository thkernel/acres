require 'test_helper'

class CommissionSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commission_setting = commission_settings(:one)
  end

  test "should get index" do
    get commission_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_commission_setting_url
    assert_response :success
  end

  test "should create commission_setting" do
    assert_difference('CommissionSetting.count') do
      post commission_settings_url, params: { commission_setting: { commission_percentage: @commission_setting.commission_percentage, user: @commission_setting.user } }
    end

    assert_redirected_to commission_setting_url(CommissionSetting.last)
  end

  test "should show commission_setting" do
    get commission_setting_url(@commission_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_commission_setting_url(@commission_setting)
    assert_response :success
  end

  test "should update commission_setting" do
    patch commission_setting_url(@commission_setting), params: { commission_setting: { commission_percentage: @commission_setting.commission_percentage, user: @commission_setting.user } }
    assert_redirected_to commission_setting_url(@commission_setting)
  end

  test "should destroy commission_setting" do
    assert_difference('CommissionSetting.count', -1) do
      delete commission_setting_url(@commission_setting)
    end

    assert_redirected_to commission_settings_url
  end
end
