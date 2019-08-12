require 'test_helper'

class MonthlyPaymentDelayExpiredsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly_payment_delay_expired = monthly_payment_delay_expireds(:one)
  end

  test "should get index" do
    get monthly_payment_delay_expireds_url
    assert_response :success
  end

  test "should get new" do
    get new_monthly_payment_delay_expired_url
    assert_response :success
  end

  test "should create monthly_payment_delay_expired" do
    assert_difference('MonthlyPaymentDelayExpired.count') do
      post monthly_payment_delay_expireds_url, params: { monthly_payment_delay_expired: { commission_amount: @monthly_payment_delay_expired.commission_amount, credit_identifier: @monthly_payment_delay_expired.credit_identifier, expiration_date: @monthly_payment_delay_expired.expiration_date, installment_identifier: @monthly_payment_delay_expired.installment_identifier, user_id: @monthly_payment_delay_expired.user_id } }
    end

    assert_redirected_to monthly_payment_delay_expired_url(MonthlyPaymentDelayExpired.last)
  end

  test "should show monthly_payment_delay_expired" do
    get monthly_payment_delay_expired_url(@monthly_payment_delay_expired)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthly_payment_delay_expired_url(@monthly_payment_delay_expired)
    assert_response :success
  end

  test "should update monthly_payment_delay_expired" do
    patch monthly_payment_delay_expired_url(@monthly_payment_delay_expired), params: { monthly_payment_delay_expired: { commission_amount: @monthly_payment_delay_expired.commission_amount, credit_identifier: @monthly_payment_delay_expired.credit_identifier, expiration_date: @monthly_payment_delay_expired.expiration_date, installment_identifier: @monthly_payment_delay_expired.installment_identifier, user_id: @monthly_payment_delay_expired.user_id } }
    assert_redirected_to monthly_payment_delay_expired_url(@monthly_payment_delay_expired)
  end

  test "should destroy monthly_payment_delay_expired" do
    assert_difference('MonthlyPaymentDelayExpired.count', -1) do
      delete monthly_payment_delay_expired_url(@monthly_payment_delay_expired)
    end

    assert_redirected_to monthly_payment_delay_expireds_url
  end
end
