require 'test_helper'

class AsrunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asrun = asruns(:one)
  end

  test "should get index" do
    get asruns_url
    assert_response :success
  end

  test "should get new" do
    get new_asrun_url
    assert_response :success
  end

  test "should create asrun" do
    assert_difference('Asrun.count') do
      post asruns_url, params: { asrun: { name: @asrun.name } }
    end

    assert_redirected_to asrun_url(Asrun.last)
  end

  test "should show asrun" do
    get asrun_url(@asrun)
    assert_response :success
  end

  test "should get edit" do
    get edit_asrun_url(@asrun)
    assert_response :success
  end

  test "should update asrun" do
    patch asrun_url(@asrun), params: { asrun: { name: @asrun.name } }
    assert_redirected_to asrun_url(@asrun)
  end

  test "should destroy asrun" do
    assert_difference('Asrun.count', -1) do
      delete asrun_url(@asrun)
    end

    assert_redirected_to asruns_url
  end
end
