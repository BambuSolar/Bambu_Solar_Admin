require 'test_helper'

class OurworksControllerTest < ActionController::TestCase
  setup do
    @ourwork = ourworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ourworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ourwork" do
    assert_difference('Ourwork.count') do
      post :create, ourwork: {  }
    end

    assert_redirected_to ourwork_path(assigns(:ourwork))
  end

  test "should show ourwork" do
    get :show, id: @ourwork
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ourwork
    assert_response :success
  end

  test "should update ourwork" do
    patch :update, id: @ourwork, ourwork: {  }
    assert_redirected_to ourwork_path(assigns(:ourwork))
  end

  test "should destroy ourwork" do
    assert_difference('Ourwork.count', -1) do
      delete :destroy, id: @ourwork
    end

    assert_redirected_to ourworks_path
  end
end
