class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, :uniqueness =>  false, :presence => true

  validates :user_name, :uniqueness =>  true, :presence => true

  validates :last_name, :uniqueness =>  false, :presence => true

end
