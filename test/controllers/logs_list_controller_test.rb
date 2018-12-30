require 'test_helper'

class LogsListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get logs_list_index_url
    assert_response :success
  end

  test "should get new" do
    get logs_list_new_url
    assert_response :success
  end

  test "should get create" do
    get logs_list_create_url
    assert_response :success
  end

  test "should get destroy" do
    get logs_list_destroy_url
    assert_response :success
  end

end
