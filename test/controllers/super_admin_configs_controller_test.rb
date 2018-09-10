require 'test_helper'

class SuperAdminConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @super_admin_config = super_admin_configs(:one)
  end

  test "should get index" do
    get super_admin_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_super_admin_config_url
    assert_response :success
  end

  test "should create super_admin_config" do
    assert_difference('SuperAdminConfig.count') do
      post super_admin_configs_url, params: { super_admin_config: { email: @super_admin_config.email, login: @super_admin_config.login } }
    end

    assert_redirected_to super_admin_config_url(SuperAdminConfig.last)
  end

  test "should show super_admin_config" do
    get super_admin_config_url(@super_admin_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_super_admin_config_url(@super_admin_config)
    assert_response :success
  end

  test "should update super_admin_config" do
    patch super_admin_config_url(@super_admin_config), params: { super_admin_config: { email: @super_admin_config.email, login: @super_admin_config.login } }
    assert_redirected_to super_admin_config_url(@super_admin_config)
  end

  test "should destroy super_admin_config" do
    assert_difference('SuperAdminConfig.count', -1) do
      delete super_admin_config_url(@super_admin_config)
    end

    assert_redirected_to super_admin_configs_url
  end
end
