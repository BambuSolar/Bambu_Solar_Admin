require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "Get Landing - With Session" do

    login_as :one_user

    get :landing

    assert_response :success

  end

  test "Get Landing - Without Session" do

    get :landing

    assert_redirected_to :login

  end

end
