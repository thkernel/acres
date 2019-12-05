require 'test_helper'

class ExcerciseYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @excercise_year = excercise_years(:one)
  end

  test "should get index" do
    get excercise_years_url
    assert_response :success
  end

  test "should get new" do
    get new_excercise_year_url
    assert_response :success
  end

  test "should create excercise_year" do
    assert_difference('ExcerciseYear.count') do
      post excercise_years_url, params: { excercise_year: { close_at: @excercise_year.close_at, name: @excercise_year.name, status: @excercise_year.status, user_id: @excercise_year.user_id } }
    end

    assert_redirected_to excercise_year_url(ExcerciseYear.last)
  end

  test "should show excercise_year" do
    get excercise_year_url(@excercise_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_excercise_year_url(@excercise_year)
    assert_response :success
  end

  test "should update excercise_year" do
    patch excercise_year_url(@excercise_year), params: { excercise_year: { close_at: @excercise_year.close_at, name: @excercise_year.name, status: @excercise_year.status, user_id: @excercise_year.user_id } }
    assert_redirected_to excercise_year_url(@excercise_year)
  end

  test "should destroy excercise_year" do
    assert_difference('ExcerciseYear.count', -1) do
      delete excercise_year_url(@excercise_year)
    end

    assert_redirected_to excercise_years_url
  end
end
