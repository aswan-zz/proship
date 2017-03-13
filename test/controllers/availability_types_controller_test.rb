require 'test_helper'

class AvailabilityTypesControllerTest < ActionController::TestCase
  setup do
    @availability_type = availability_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:availability_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create availability_type" do
    assert_difference('AvailabilityType.count') do
      post :create, availability_type: { default_color: @availability_type.default_color, icon: @availability_type.icon, name: @availability_type.name }
    end

    assert_redirected_to availability_type_path(assigns(:availability_type))
  end

  test "should show availability_type" do
    get :show, id: @availability_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @availability_type
    assert_response :success
  end

  test "should update availability_type" do
    patch :update, id: @availability_type, availability_type: { default_color: @availability_type.default_color, icon: @availability_type.icon, name: @availability_type.name }
    assert_redirected_to availability_type_path(assigns(:availability_type))
  end

  test "should destroy availability_type" do
    assert_difference('AvailabilityType.count', -1) do
      delete :destroy, id: @availability_type
    end

    assert_redirected_to availability_types_path
  end
end
