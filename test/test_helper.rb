ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  class ActionController::TestCase

    def login_as(user)
      @request.session['user_id'] = user ? users(user).id : nil
    end
  end

end
