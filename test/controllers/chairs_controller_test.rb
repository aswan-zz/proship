require 'test_helper'

class ChairsControllerTest < ActionController::TestCase
  setup do
    @chair = chairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chair" do
    assert_difference('Chair.count') do
      post :create, chair: { name: @chair.name, room_id: @chair.room_id }
    end

    assert_redirected_to chair_path(assigns(:chair))
  end

  test "should show chair" do
    get :show, id: @chair
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chair
    assert_response :success
  end

  test "should update chair" do
    patch :update, id: @chair, chair: { name: @chair.name, room_id: @chair.room_id }
    assert_redirected_to chair_path(assigns(:chair))
  end

  test "should destroy chair" do
    assert_difference('Chair.count', -1) do
      delete :destroy, id: @chair
    end

    assert_redirected_to chairs_path
  end
end
