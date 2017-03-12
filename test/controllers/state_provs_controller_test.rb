require 'test_helper'

class StateProvsControllerTest < ActionController::TestCase
  setup do
    @state_prov = state_provs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:state_provs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create state_prov" do
    assert_difference('StateProv.count') do
      post :create, state_prov: { name: @state_prov.name }
    end

    assert_redirected_to state_prov_path(assigns(:state_prov))
  end

  test "should show state_prov" do
    get :show, id: @state_prov
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @state_prov
    assert_response :success
  end

  test "should update state_prov" do
    patch :update, id: @state_prov, state_prov: { name: @state_prov.name }
    assert_redirected_to state_prov_path(assigns(:state_prov))
  end

  test "should destroy state_prov" do
    assert_difference('StateProv.count', -1) do
      delete :destroy, id: @state_prov
    end

    assert_redirected_to state_provs_path
  end
end
