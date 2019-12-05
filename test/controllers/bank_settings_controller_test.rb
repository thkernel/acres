require 'test_helper'

class BankSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_setting = bank_settings(:one)
  end

  test "should get index" do
    get bank_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_setting_url
    assert_response :success
  end

  test "should create bank_setting" do
    assert_difference('BankSetting.count') do
      post bank_settings_url, params: { bank_setting: { bank_id: @bank_setting.bank_id, commission_percentage: @bank_setting.commission_percentage, company_remaining_commission_rate: @bank_setting.company_remaining_commission_rate, excercise_year_id: @bank_setting.excercise_year_id, first_installment: @bank_setting.first_installment, hypoplus_commission_percentage: @bank_setting.hypoplus_commission_percentage, number_of_dates: @bank_setting.number_of_dates, number_of_remaining_days: @bank_setting.number_of_remaining_days, status: @bank_setting.status } }
    end

    assert_redirected_to bank_setting_url(BankSetting.last)
  end

  test "should show bank_setting" do
    get bank_setting_url(@bank_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_setting_url(@bank_setting)
    assert_response :success
  end

  test "should update bank_setting" do
    patch bank_setting_url(@bank_setting), params: { bank_setting: { bank_id: @bank_setting.bank_id, commission_percentage: @bank_setting.commission_percentage, company_remaining_commission_rate: @bank_setting.company_remaining_commission_rate, excercise_year_id: @bank_setting.excercise_year_id, first_installment: @bank_setting.first_installment, hypoplus_commission_percentage: @bank_setting.hypoplus_commission_percentage, number_of_dates: @bank_setting.number_of_dates, number_of_remaining_days: @bank_setting.number_of_remaining_days, status: @bank_setting.status } }
    assert_redirected_to bank_setting_url(@bank_setting)
  end

  test "should destroy bank_setting" do
    assert_difference('BankSetting.count', -1) do
      delete bank_setting_url(@bank_setting)
    end

    assert_redirected_to bank_settings_url
  end
end
