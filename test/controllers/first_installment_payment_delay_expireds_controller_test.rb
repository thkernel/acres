require 'test_helper'

class FirstInstallmentPaymentDelayExpiredsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_installment_payment_delay_expired = first_installment_payment_delay_expireds(:one)
  end

  test "should get index" do
    get first_installment_payment_delay_expireds_url
    assert_response :success
  end

  test "should get new" do
    get new_first_installment_payment_delay_expired_url
    assert_response :success
  end

  test "should create first_installment_payment_delay_expired" do
    assert_difference('FirstInstallmentPaymentDelayExpired.count') do
      post first_installment_payment_delay_expireds_url, params: { first_installment_payment_delay_expired: { credit_amount: @first_installment_payment_delay_expired.credit_amount, credit_id: @first_installment_payment_delay_expired.credit_id, expiration_date: @first_installment_payment_delay_expired.expiration_date, first_installment_percentage: @first_installment_payment_delay_expired.first_installment_percentage, installment: @first_installment_payment_delay_expired.installment, installment_amount: @first_installment_payment_delay_expired.installment_amount, status: @first_installment_payment_delay_expired.status, user_id: @first_installment_payment_delay_expired.user_id } }
    end

    assert_redirected_to first_installment_payment_delay_expired_url(FirstInstallmentPaymentDelayExpired.last)
  end

  test "should show first_installment_payment_delay_expired" do
    get first_installment_payment_delay_expired_url(@first_installment_payment_delay_expired)
    assert_response :success
  end

  test "should get edit" do
    get edit_first_installment_payment_delay_expired_url(@first_installment_payment_delay_expired)
    assert_response :success
  end

  test "should update first_installment_payment_delay_expired" do
    patch first_installment_payment_delay_expired_url(@first_installment_payment_delay_expired), params: { first_installment_payment_delay_expired: { credit_amount: @first_installment_payment_delay_expired.credit_amount, credit_id: @first_installment_payment_delay_expired.credit_id, expiration_date: @first_installment_payment_delay_expired.expiration_date, first_installment_percentage: @first_installment_payment_delay_expired.first_installment_percentage, installment: @first_installment_payment_delay_expired.installment, installment_amount: @first_installment_payment_delay_expired.installment_amount, status: @first_installment_payment_delay_expired.status, user_id: @first_installment_payment_delay_expired.user_id } }
    assert_redirected_to first_installment_payment_delay_expired_url(@first_installment_payment_delay_expired)
  end

  test "should destroy first_installment_payment_delay_expired" do
    assert_difference('FirstInstallmentPaymentDelayExpired.count', -1) do
      delete first_installment_payment_delay_expired_url(@first_installment_payment_delay_expired)
    end

    assert_redirected_to first_installment_payment_delay_expireds_url
  end
end
