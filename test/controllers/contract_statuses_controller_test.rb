require 'test_helper'

class ContractStatusesControllerTest < ActionController::TestCase
  setup do
    @contract_status = contract_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_status" do
    assert_difference('ContractStatus.count') do
      post :create, contract_status: { name: @contract_status.name }
    end

    assert_redirected_to contract_status_path(assigns(:contract_status))
  end

  test "should show contract_status" do
    get :show, id: @contract_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract_status
    assert_response :success
  end

  test "should update contract_status" do
    patch :update, id: @contract_status, contract_status: { name: @contract_status.name }
    assert_redirected_to contract_status_path(assigns(:contract_status))
  end

  test "should destroy contract_status" do
    assert_difference('ContractStatus.count', -1) do
      delete :destroy, id: @contract_status
    end

    assert_redirected_to contract_statuses_path
  end
end
