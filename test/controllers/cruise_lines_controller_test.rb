require 'test_helper'

class CruiseLinesControllerTest < ActionController::TestCase
  setup do
    @cruise_line = cruise_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cruise_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cruise_line" do
    assert_difference('CruiseLine.count') do
      post :create, cruise_line: { name: @cruise_line.name, short_name: @cruise_line.short_name }
    end

    assert_redirected_to cruise_line_path(assigns(:cruise_line))
  end

  test "should show cruise_line" do
    get :show, id: @cruise_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cruise_line
    assert_response :success
  end

  test "should update cruise_line" do
    patch :update, id: @cruise_line, cruise_line: { name: @cruise_line.name, short_name: @cruise_line.short_name }
    assert_redirected_to cruise_line_path(assigns(:cruise_line))
  end

  test "should destroy cruise_line" do
    assert_difference('CruiseLine.count', -1) do
      delete :destroy, id: @cruise_line
    end

    assert_redirected_to cruise_lines_path
  end
end
