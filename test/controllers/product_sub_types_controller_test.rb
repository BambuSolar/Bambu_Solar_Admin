require 'test_helper'

class ProductSubTypesControllerTest < ActionController::TestCase
  setup do
    @product_sub_type = product_sub_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_sub_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_sub_type" do
    assert_difference('ProductSubType.count') do
      post :create, product_sub_type: { name: @product_sub_type.name, type_product: @product_sub_type.type_product }
    end

    assert_redirected_to product_sub_type_path(assigns(:product_sub_type))
  end

  test "should show product_sub_type" do
    get :show, id: @product_sub_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_sub_type
    assert_response :success
  end

  test "should update product_sub_type" do
    patch :update, id: @product_sub_type, product_sub_type: { name: @product_sub_type.name, type_product: @product_sub_type.type_product }
    assert_redirected_to product_sub_type_path(assigns(:product_sub_type))
  end

  test "should destroy product_sub_type" do
    assert_difference('ProductSubType.count', -1) do
      delete :destroy, id: @product_sub_type
    end

    assert_redirected_to product_sub_types_path
  end
end
