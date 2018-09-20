require 'test_helper'

class BankCommissionEditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_commission_edition = bank_commission_editions(:one)
  end

  test "should get index" do
    get bank_commission_editions_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_commission_edition_url
    assert_response :success
  end

  test "should create bank_commission_edition" do
    assert_difference('BankCommissionEdition.count') do
      post bank_commission_editions_url, params: { bank_commission_edition: { completed: @bank_commission_edition.completed, date_effet: @bank_commission_edition.date_effet } }
    end

    assert_redirected_to bank_commission_edition_url(BankCommissionEdition.last)
  end

  test "should show bank_commission_edition" do
    get bank_commission_edition_url(@bank_commission_edition)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_commission_edition_url(@bank_commission_edition)
    assert_response :success
  end

  test "should update bank_commission_edition" do
    patch bank_commission_edition_url(@bank_commission_edition), params: { bank_commission_edition: { completed: @bank_commission_edition.completed, date_effet: @bank_commission_edition.date_effet } }
    assert_redirected_to bank_commission_edition_url(@bank_commission_edition)
  end

  test "should destroy bank_commission_edition" do
    assert_difference('BankCommissionEdition.count', -1) do
      delete bank_commission_edition_url(@bank_commission_edition)
    end

    assert_redirected_to bank_commission_editions_url
  end
end
