require 'test_helper'

class StoreConfigsControllerTest < ActionController::TestCase
  setup do
    @store_config = store_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_config" do
    assert_difference('StoreConfig.count') do
      post :create, :store_config => @store_config.attributes
    end

    assert_redirected_to store_config_path(assigns(:store_config))
  end

  test "should show store_config" do
    get :show, :id => @store_config.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @store_config.to_param
    assert_response :success
  end

  test "should update store_config" do
    put :update, :id => @store_config.to_param, :store_config => @store_config.attributes
    assert_redirected_to store_config_path(assigns(:store_config))
  end

  test "should destroy store_config" do
    assert_difference('StoreConfig.count', -1) do
      delete :destroy, :id => @store_config.to_param
    end

    assert_redirected_to store_configs_path
  end
end
