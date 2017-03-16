require 'test_helper'

class ReminderTypesControllerTest < ActionController::TestCase
  setup do
    @reminder_type = reminder_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reminder_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reminder_type" do
    assert_difference('ReminderType.count') do
      post :create, reminder_type: { default_color: @reminder_type.default_color, icon: @reminder_type.icon, name: @reminder_type.name }
    end

    assert_redirected_to reminder_type_path(assigns(:reminder_type))
  end

  test "should show reminder_type" do
    get :show, id: @reminder_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reminder_type
    assert_response :success
  end

  test "should update reminder_type" do
    patch :update, id: @reminder_type, reminder_type: { default_color: @reminder_type.default_color, icon: @reminder_type.icon, name: @reminder_type.name }
    assert_redirected_to reminder_type_path(assigns(:reminder_type))
  end

  test "should destroy reminder_type" do
    assert_difference('ReminderType.count', -1) do
      delete :destroy, id: @reminder_type
    end

    assert_redirected_to reminder_types_path
  end
end
