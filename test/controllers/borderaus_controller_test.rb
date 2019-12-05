require 'test_helper'

class BorderausControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borderau = borderaus(:one)
  end

  test "should get index" do
    get borderaus_url
    assert_response :success
  end

  test "should get new" do
    get new_borderau_url
    assert_response :success
  end

  test "should create borderau" do
    assert_difference('Borderau.count') do
      post borderaus_url, params: { borderau: { credit_identifier: @borderau.credit_identifier, excercise_year_id_id: @borderau.excercise_year_id_id, file_name: @borderau.file_name, installment: @borderau.installment, name: @borderau.name } }
    end

    assert_redirected_to borderau_url(Borderau.last)
  end

  test "should show borderau" do
    get borderau_url(@borderau)
    assert_response :success
  end

  test "should get edit" do
    get edit_borderau_url(@borderau)
    assert_response :success
  end

  test "should update borderau" do
    patch borderau_url(@borderau), params: { borderau: { credit_identifier: @borderau.credit_identifier, excercise_year_id_id: @borderau.excercise_year_id_id, file_name: @borderau.file_name, installment: @borderau.installment, name: @borderau.name } }
    assert_redirected_to borderau_url(@borderau)
  end

  test "should destroy borderau" do
    assert_difference('Borderau.count', -1) do
      delete borderau_url(@borderau)
    end

    assert_redirected_to borderaus_url
  end
end
