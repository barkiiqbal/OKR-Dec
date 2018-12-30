require 'test_helper'

class AsRunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @as_run = as_runs(:one)
  end

  test "should get index" do
    get as_runs_url
    assert_response :success
  end

  test "should get new" do
    get new_as_run_url
    assert_response :success
  end

  test "should create as_run" do
    assert_difference('AsRun.count') do
      post as_runs_url, params: { as_run: { attachment: @as_run.attachment, name: @as_run.name } }
    end

    assert_redirected_to as_run_url(AsRun.last)
  end

  test "should show as_run" do
    get as_run_url(@as_run)
    assert_response :success
  end

  test "should get edit" do
    get edit_as_run_url(@as_run)
    assert_response :success
  end

  test "should update as_run" do
    patch as_run_url(@as_run), params: { as_run: { attachment: @as_run.attachment, name: @as_run.name } }
    assert_redirected_to as_run_url(@as_run)
  end

  test "should destroy as_run" do
    assert_difference('AsRun.count', -1) do
      delete as_run_url(@as_run)
    end

    assert_redirected_to as_runs_url
  end
end
