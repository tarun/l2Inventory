require 'test_helper'

class TransfersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transfers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transfer" do
    assert_difference('Transfer.count') do
      post :create, :transfer => { }
    end

    assert_redirected_to transfer_path(assigns(:transfer))
  end

  test "should show transfer" do
    get :show, :id => transfers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => transfers(:one).to_param
    assert_response :success
  end

  test "should update transfer" do
    put :update, :id => transfers(:one).to_param, :transfer => { }
    assert_redirected_to transfer_path(assigns(:transfer))
  end

  test "should destroy transfer" do
    assert_difference('Transfer.count', -1) do
      delete :destroy, :id => transfers(:one).to_param
    end

    assert_redirected_to transfers_path
  end
end
