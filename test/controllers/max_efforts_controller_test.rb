require 'test_helper'

class MaxEffortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @max_effort = max_efforts(:one)
  end

  test "should get index" do
    get max_efforts_url
    assert_response :success
  end

  test "should get new" do
    get new_max_effort_url
    assert_response :success
  end

  test "should create max_effort" do
    assert_difference('MaxEffort.count') do
      post max_efforts_url, params: { max_effort: { exercise_id: @max_effort.exercise_id, max_amount: @max_effort.max_amount, user_id: @max_effort.user_id } }
    end

    assert_redirected_to max_effort_url(MaxEffort.last)
  end

  test "should show max_effort" do
    get max_effort_url(@max_effort)
    assert_response :success
  end

  test "should get edit" do
    get edit_max_effort_url(@max_effort)
    assert_response :success
  end

  test "should update max_effort" do
    patch max_effort_url(@max_effort), params: { max_effort: { exercise_id: @max_effort.exercise_id, max_amount: @max_effort.max_amount, user_id: @max_effort.user_id } }
    assert_redirected_to max_effort_url(@max_effort)
  end

  test "should destroy max_effort" do
    assert_difference('MaxEffort.count', -1) do
      delete max_effort_url(@max_effort)
    end

    assert_redirected_to max_efforts_url
  end
end
