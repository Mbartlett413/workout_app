require 'test_helper'

class SetRepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @set_rep = set_reps(:one)
  end

  test "should get index" do
    get set_reps_url
    assert_response :success
  end

  test "should get new" do
    get new_set_rep_url
    assert_response :success
  end

  test "should create set_rep" do
    assert_difference('SetRep.count') do
      post set_reps_url, params: { set_rep: { title: @set_rep.title } }
    end

    assert_redirected_to set_rep_url(SetRep.last)
  end

  test "should show set_rep" do
    get set_rep_url(@set_rep)
    assert_response :success
  end

  test "should get edit" do
    get edit_set_rep_url(@set_rep)
    assert_response :success
  end

  test "should update set_rep" do
    patch set_rep_url(@set_rep), params: { set_rep: { title: @set_rep.title } }
    assert_redirected_to set_rep_url(@set_rep)
  end

  test "should destroy set_rep" do
    assert_difference('SetRep.count', -1) do
      delete set_rep_url(@set_rep)
    end

    assert_redirected_to set_reps_url
  end
end
