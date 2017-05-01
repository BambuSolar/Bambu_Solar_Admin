require 'test_helper'

class HomeWebsiteConfigsControllerTest < ActionController::TestCase
  setup do
    @home_website_config = home_website_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_website_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_website_config" do
    assert_difference('HomeWebsiteConfig.count') do
      post :create, home_website_config: { horizontal_picture: @home_website_config.horizontal_picture, vertical_picture: @home_website_config.vertical_picture, welcome_message: @home_website_config.welcome_message }
    end

    assert_redirected_to home_website_config_path(assigns(:home_website_config))
  end

  test "should show home_website_config" do
    get :show, id: @home_website_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_website_config
    assert_response :success
  end

  test "should update home_website_config" do
    patch :update, id: @home_website_config, home_website_config: { horizontal_picture: @home_website_config.horizontal_picture, vertical_picture: @home_website_config.vertical_picture, welcome_message: @home_website_config.welcome_message }
    assert_redirected_to home_website_config_path(assigns(:home_website_config))
  end

  test "should destroy home_website_config" do
    assert_difference('HomeWebsiteConfig.count', -1) do
      delete :destroy, id: @home_website_config
    end

    assert_redirected_to home_website_configs_path
  end
end
