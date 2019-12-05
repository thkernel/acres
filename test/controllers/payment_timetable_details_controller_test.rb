require 'test_helper'

class PaymentTimetableDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_timetable_detail = payment_timetable_details(:one)
  end

  test "should get index" do
    get payment_timetable_details_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_timetable_detail_url
    assert_response :success
  end

  test "should create payment_timetable_detail" do
    assert_difference('PaymentTimetableDetail.count') do
      post payment_timetable_details_url, params: { payment_timetable_detail: { payment_timetable_id: @payment_timetable_detail.payment_timetable_id, status: @payment_timetable_detail.status } }
    end

    assert_redirected_to payment_timetable_detail_url(PaymentTimetableDetail.last)
  end

  test "should show payment_timetable_detail" do
    get payment_timetable_detail_url(@payment_timetable_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_timetable_detail_url(@payment_timetable_detail)
    assert_response :success
  end

  test "should update payment_timetable_detail" do
    patch payment_timetable_detail_url(@payment_timetable_detail), params: { payment_timetable_detail: { payment_timetable_id: @payment_timetable_detail.payment_timetable_id, status: @payment_timetable_detail.status } }
    assert_redirected_to payment_timetable_detail_url(@payment_timetable_detail)
  end

  test "should destroy payment_timetable_detail" do
    assert_difference('PaymentTimetableDetail.count', -1) do
      delete payment_timetable_detail_url(@payment_timetable_detail)
    end

    assert_redirected_to payment_timetable_details_url
  end
end
