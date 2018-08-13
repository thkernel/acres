require 'test_helper'

class ConfigOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @config_option = config_options(:one)
  end

  test "should get index" do
    get config_options_url
    assert_response :success
  end

  test "should get new" do
    get new_config_option_url
    assert_response :success
  end

  test "should create config_option" do
    assert_difference('ConfigOption.count') do
      post config_options_url, params: { config_option: { app_name: @config_option.app_name } }
    end

    assert_redirected_to config_option_url(ConfigOption.last)
  end

  test "should show config_option" do
    get config_option_url(@config_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_config_option_url(@config_option)
    assert_response :success
  end

  test "should update config_option" do
    patch config_option_url(@config_option), params: { config_option: { app_name: @config_option.app_name } }
    assert_redirected_to config_option_url(@config_option)
  end

  test "should destroy config_option" do
    assert_difference('ConfigOption.count', -1) do
      delete config_option_url(@config_option)
    end

    assert_redirected_to config_options_url
  end
end
