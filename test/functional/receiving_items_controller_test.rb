require 'test_helper'

class ReceivingItemsControllerTest < ActionController::TestCase
  setup do
    @receiving_item = receiving_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receiving_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receiving_item" do
    assert_difference('ReceivingItem.count') do
      post :create, :receiving_item => @receiving_item.attributes
    end

    assert_redirected_to receiving_item_path(assigns(:receiving_item))
  end

  test "should show receiving_item" do
    get :show, :id => @receiving_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @receiving_item.to_param
    assert_response :success
  end

  test "should update receiving_item" do
    put :update, :id => @receiving_item.to_param, :receiving_item => @receiving_item.attributes
    assert_redirected_to receiving_item_path(assigns(:receiving_item))
  end

  test "should destroy receiving_item" do
    assert_difference('ReceivingItem.count', -1) do
      delete :destroy, :id => @receiving_item.to_param
    end

    assert_redirected_to receiving_items_path
  end
end
