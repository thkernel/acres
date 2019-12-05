require 'test_helper'

class PaymentTimetablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_timetable = payment_timetables(:one)
  end

  test "should get index" do
    get payment_timetables_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_timetable_url
    assert_response :success
  end

  test "should create payment_timetable" do
    assert_difference('PaymentTimetable.count') do
      post payment_timetables_url, params: { payment_timetable: { credit_identifier: @payment_timetable.credit_identifier, excercise_year_id: @payment_timetable.excercise_year_id, type: @payment_timetable.type } }
    end

    assert_redirected_to payment_timetable_url(PaymentTimetable.last)
  end

  test "should show payment_timetable" do
    get payment_timetable_url(@payment_timetable)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_timetable_url(@payment_timetable)
    assert_response :success
  end

  test "should update payment_timetable" do
    patch payment_timetable_url(@payment_timetable), params: { payment_timetable: { credit_identifier: @payment_timetable.credit_identifier, excercise_year_id: @payment_timetable.excercise_year_id, type: @payment_timetable.type } }
    assert_redirected_to payment_timetable_url(@payment_timetable)
  end

  test "should destroy payment_timetable" do
    assert_difference('PaymentTimetable.count', -1) do
      delete payment_timetable_url(@payment_timetable)
    end

    assert_redirected_to payment_timetables_url
  end
end
