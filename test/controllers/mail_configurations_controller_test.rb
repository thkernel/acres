require 'test_helper'

class MailConfigurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mail_configuration = mail_configurations(:one)
  end

  test "should get index" do
    get mail_configurations_url
    assert_response :success
  end

  test "should get new" do
    get new_mail_configuration_url
    assert_response :success
  end

  test "should create mail_configuration" do
    assert_difference('MailConfiguration.count') do
      post mail_configurations_url, params: { mail_configuration: { address: @mail_configuration.address, authentication: @mail_configuration.authentication, boolean: @mail_configuration.boolean, domain: @mail_configuration.domain, enable_starttls_auto: @mail_configuration.enable_starttls_auto, host: @mail_configuration.host, password: @mail_configuration.password, port: @mail_configuration.port, ssl: @mail_configuration.ssl, user_id: @mail_configuration.user_id, user_name: @mail_configuration.user_name } }
    end

    assert_redirected_to mail_configuration_url(MailConfiguration.last)
  end

  test "should show mail_configuration" do
    get mail_configuration_url(@mail_configuration)
    assert_response :success
  end

  test "should get edit" do
    get edit_mail_configuration_url(@mail_configuration)
    assert_response :success
  end

  test "should update mail_configuration" do
    patch mail_configuration_url(@mail_configuration), params: { mail_configuration: { address: @mail_configuration.address, authentication: @mail_configuration.authentication, boolean: @mail_configuration.boolean, domain: @mail_configuration.domain, enable_starttls_auto: @mail_configuration.enable_starttls_auto, host: @mail_configuration.host, password: @mail_configuration.password, port: @mail_configuration.port, ssl: @mail_configuration.ssl, user_id: @mail_configuration.user_id, user_name: @mail_configuration.user_name } }
    assert_redirected_to mail_configuration_url(@mail_configuration)
  end

  test "should destroy mail_configuration" do
    assert_difference('MailConfiguration.count', -1) do
      delete mail_configuration_url(@mail_configuration)
    end

    assert_redirected_to mail_configurations_url
  end
end
