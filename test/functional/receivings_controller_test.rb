require 'test_helper'

class ReceivingsControllerTest < ActionController::TestCase
  setup do
    @receiving = receivings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receivings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receiving" do
    assert_difference('Receiving.count') do
      post :create, :receiving => @receiving.attributes
    end

    assert_redirected_to receiving_path(assigns(:receiving))
  end

  test "should show receiving" do
    get :show, :id => @receiving.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @receiving.to_param
    assert_response :success
  end

  test "should update receiving" do
    put :update, :id => @receiving.to_param, :receiving => @receiving.attributes
    assert_redirected_to receiving_path(assigns(:receiving))
  end

  test "should destroy receiving" do
    assert_difference('Receiving.count', -1) do
      delete :destroy, :id => @receiving.to_param
    end

    assert_redirected_to receivings_path
  end
end
