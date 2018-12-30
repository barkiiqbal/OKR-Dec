require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log = logs(:one)
  end

  test "should get index" do
    get logs_url
    assert_response :success
  end

  test "should get new" do
    get new_log_url
    assert_response :success
  end

  test "should create log" do
    assert_difference('Log.count') do
      post logs_url, params: { log: { c1: @log.c1, c10: @log.c10, c11: @log.c11, c12: @log.c12, c13: @log.c13, c2: @log.c2, c3: @log.c3, c4: @log.c4, c5: @log.c5, c6: @log.c6, c7: @log.c7, c8: @log.c8, c9: @log.c9 } }
    end

    assert_redirected_to log_url(Log.last)
  end

  test "should show log" do
    get log_url(@log)
    assert_response :success
  end

  test "should get edit" do
    get edit_log_url(@log)
    assert_response :success
  end

  test "should update log" do
    patch log_url(@log), params: { log: { c1: @log.c1, c10: @log.c10, c11: @log.c11, c12: @log.c12, c13: @log.c13, c2: @log.c2, c3: @log.c3, c4: @log.c4, c5: @log.c5, c6: @log.c6, c7: @log.c7, c8: @log.c8, c9: @log.c9 } }
    assert_redirected_to log_url(@log)
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete log_url(@log)
    end

    assert_redirected_to logs_url
  end
end
