require 'test_helper'

class NotariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notary = notaries(:one)
  end

  test "should get index" do
    get notaries_url
    assert_response :success
  end

  test "should get new" do
    get new_notary_url
    assert_response :success
  end

  test "should create notary" do
    assert_difference('Notary.count') do
      post notaries_url, params: { notary: { address: @notary.address, email: @notary.email, full_name: @notary.full_name, phone: @notary.phone } }
    end

    assert_redirected_to notary_url(Notary.last)
  end

  test "should show notary" do
    get notary_url(@notary)
    assert_response :success
  end

  test "should get edit" do
    get edit_notary_url(@notary)
    assert_response :success
  end

  test "should update notary" do
    patch notary_url(@notary), params: { notary: { address: @notary.address, email: @notary.email, full_name: @notary.full_name, phone: @notary.phone } }
    assert_redirected_to notary_url(@notary)
  end

  test "should destroy notary" do
    assert_difference('Notary.count', -1) do
      delete notary_url(@notary)
    end

    assert_redirected_to notaries_url
  end
end
