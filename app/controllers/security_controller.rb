class SecurityController < ApplicationController

  before_filter :require_user

end
