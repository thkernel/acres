require 'test_helper'

class ProducersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producer = producers(:one)
  end

  test "should get index" do
    get producers_url
    assert_response :success
  end

  test "should get new" do
    get new_producer_url
    assert_response :success
  end

  test "should create producer" do
    assert_difference('Producer.count') do
      post producers_url, params: { producer: { address: @producer.address, city: @producer.city, country: @producer.country, email: @producer.email, first_name: @producer.first_name, last_name: @producer.last_name, notes: @producer.notes, phone: @producer.phone } }
    end

    assert_redirected_to producer_url(Producer.last)
  end

  test "should show producer" do
    get producer_url(@producer)
    assert_response :success
  end

  test "should get edit" do
    get edit_producer_url(@producer)
    assert_response :success
  end

  test "should update producer" do
    patch producer_url(@producer), params: { producer: { address: @producer.address, city: @producer.city, country: @producer.country, email: @producer.email, first_name: @producer.first_name, last_name: @producer.last_name, notes: @producer.notes, phone: @producer.phone } }
    assert_redirected_to producer_url(@producer)
  end

  test "should destroy producer" do
    assert_difference('Producer.count', -1) do
      delete producer_url(@producer)
    end

    assert_redirected_to producers_url
  end
end
