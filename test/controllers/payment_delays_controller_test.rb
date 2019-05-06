require 'test_helper'

class PaymentDelaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_delay = payment_delays(:one)
  end

  test "should get index" do
    get payment_delays_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_delay_url
    assert_response :success
  end

  test "should create payment_delay" do
    assert_difference('PaymentDelay.count') do
      post payment_delays_url, params: { payment_delay: { first_installment: @payment_delay.first_installment, monthly_deadlines_before_payment: @payment_delay.monthly_deadlines_before_payment, monthly_installments: @payment_delay.monthly_installments, user_id: @payment_delay.user_id } }
    end

    assert_redirected_to payment_delay_url(PaymentDelay.last)
  end

  test "should show payment_delay" do
    get payment_delay_url(@payment_delay)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_delay_url(@payment_delay)
    assert_response :success
  end

  test "should update payment_delay" do
    patch payment_delay_url(@payment_delay), params: { payment_delay: { first_installment: @payment_delay.first_installment, monthly_deadlines_before_payment: @payment_delay.monthly_deadlines_before_payment, monthly_installments: @payment_delay.monthly_installments, user_id: @payment_delay.user_id } }
    assert_redirected_to payment_delay_url(@payment_delay)
  end

  test "should destroy payment_delay" do
    assert_difference('PaymentDelay.count', -1) do
      delete payment_delay_url(@payment_delay)
    end

    assert_redirected_to payment_delays_url
  end
end
