require 'test_helper'

class DispatcherControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dispatcher_index_url
    assert_response :success
  end

end
