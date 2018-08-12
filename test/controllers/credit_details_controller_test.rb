require 'test_helper'

class CreditDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_detail = credit_details(:one)
  end

  test "should get index" do
    get credit_details_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_detail_url
    assert_response :success
  end

  test "should create credit_detail" do
    assert_difference('CreditDetail.count') do
      post credit_details_url, params: { credit_detail: { commission: @credit_detail.commission, cumulative_amount: @credit_detail.cumulative_amount, installment_date: @credit_detail.installment_date, installment_payment: @credit_detail.installment_payment, paid_by_bank: @credit_detail.paid_by_bank, paid_to_contributor_or_producer: @credit_detail.paid_to_contributor_or_producer } }
    end

    assert_redirected_to credit_detail_url(CreditDetail.last)
  end

  test "should show credit_detail" do
    get credit_detail_url(@credit_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_detail_url(@credit_detail)
    assert_response :success
  end

  test "should update credit_detail" do
    patch credit_detail_url(@credit_detail), params: { credit_detail: { commission: @credit_detail.commission, cumulative_amount: @credit_detail.cumulative_amount, installment_date: @credit_detail.installment_date, installment_payment: @credit_detail.installment_payment, paid_by_bank: @credit_detail.paid_by_bank, paid_to_contributor_or_producer: @credit_detail.paid_to_contributor_or_producer } }
    assert_redirected_to credit_detail_url(@credit_detail)
  end

  test "should destroy credit_detail" do
    assert_difference('CreditDetail.count', -1) do
      delete credit_detail_url(@credit_detail)
    end

    assert_redirected_to credit_details_url
  end
end
