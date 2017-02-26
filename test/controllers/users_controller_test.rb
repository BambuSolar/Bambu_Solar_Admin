require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test 'Get Index With Session' do

    login_as :one_user

    get :index

    assert(assigns(:users).class.to_s, 'User::ActiveRecord_Relation')

    assert(assigns(:users)).equal? User.all

    assert_response :success

    assert_template :index

  end

  test 'Get Index Without Session' do

    get :index

    assert_redirected_to :login

  end

  test 'New With Session' do


    login_as :one_user

    get :new

    assert(assigns(:user).kind_of? User )

    assert_response :success

    assert_template :new

  end

  test 'New Without Session' do

    get :create

    assert_redirected_to :login

  end

  test 'Create With Session - Fails - Parameter Incorrect - User' do

    login_as :one_user

    json = {
        first_name: 'test',
        last_name: 'test',
        user_name: 'test',
        password: 'test'
    }

    begin

      post :create, :algo => json

    rescue => ex

      assert ex, 'param is missing or the value is empty: user'

      assert_response :success

    end


  end

  test 'Create With Session - Fails - Parameter Incorrect - first_name' do

    login_as :one_user

    json = {
        last_name: "test #{Time.now.to_i}" ,
        user_name: "test #{Time.now.to_i}",
        password: "test #{Time.now.to_i}"
    }

    post :create, :user => json

    assert_response 200

    assert assigns(:user).errors.as_json == {:first_name=>["can't be blank"], :last_name=>[], :user_name=>[], :password=>[]}

  end

  test 'Create With Session - Fails - Parameter Incorrect - last_name' do

    login_as :one_user

    json = {
        first_name: "test #{Time.now.to_i}" ,
        user_name: "test #{Time.now.to_i}",
        password: "test #{Time.now.to_i}"
    }

    post :create, :user => json

    assert_response 200

    assert assigns(:user).errors.as_json == {:first_name=>[], :last_name=>["can't be blank"], :user_name=>[], :password=>[]}

  end

  test 'Create With Session - Fails - Parameter Incorrect - user_name' do

    login_as :one_user

    json = {
        first_name: "test #{Time.now.to_i}" ,
        last_name: "test #{Time.now.to_i}",
        password: "test #{Time.now.to_i}"
    }

    post :create, :user => json

    assert_response 200

    assert assigns(:user).errors.as_json == {:first_name=>[], :last_name=>[], :user_name=>["can't be blank"], :password=>[]}

  end

  test 'Create With Session - Fails - Parameter Incorrect - password' do

    login_as :one_user

    json = {
        first_name: "test #{Time.now.to_i}" ,
        last_name: "test #{Time.now.to_i}",
        user_name: "test #{Time.now.to_i}"
    }

    post :create, :user => json

    assert_response 200

    assert assigns(:user).errors.as_json == {:first_name=>[], :last_name=>[], :user_name=>[], :password=>["can't be blank"]}

  end

  test 'Create With Session - Fails - User Exists' do

    login_as :one_user

    user = User.first

    json = {
        first_name: user.first_name,
        last_name: user.last_name,
        user_name: user.user_name,
        password: "test #{Time.now.to_i}"
    }

    post :create, :user => json

    assert_response 200

    assert assigns(:user).errors.to_hash == {:user_name=>["has already been taken"], :last_name=>[], :first_name=>[], :password=>[]}

  end

  test 'Create With Session - Correct' do

    login_as :one_user

    json = {
        first_name: "test #{Time.now.to_i}",
        last_name: "test #{Time.now.to_i}",
        user_name: "test #{Time.now.to_i}",
        password: "test #{Time.now.to_i}"
    }

    post :create, :user => json

    assert_response 302

    assert(flash[:notice], 'El usuario ha sido creado correctamente')

    assert_redirected_to users_url

  end

  test 'Create Without Session' do

    post :create

    assert_redirected_to :login

  end



end
