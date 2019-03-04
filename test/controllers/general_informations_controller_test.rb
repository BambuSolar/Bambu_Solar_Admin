require 'test_helper'

class GeneralInformationsControllerTest < ActionController::TestCase
  setup do
    @general_information = general_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:general_information)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create general_information" do
    assert_difference('GeneralInformation.count') do
      post :create, general_information: { catalog: @general_information.catalog, demonstrative_video: @general_information.demonstrative_video }
    end

    assert_redirected_to general_information_path(assigns(:general_information))
  end

  test "should show general_information" do
    get :show, id: @general_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @general_information
    assert_response :success
  end

  test "should update general_information" do
    patch :update, id: @general_information, general_information: { catalog: @general_information.catalog, demonstrative_video: @general_information.demonstrative_video }
    assert_redirected_to general_information_path(assigns(:general_information))
  end

  test "should destroy general_information" do
    assert_difference('GeneralInformation.count', -1) do
      delete :destroy, id: @general_information
    end

    assert_redirected_to general_informations_path
  end
end
