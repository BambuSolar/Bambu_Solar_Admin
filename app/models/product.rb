class Product < ActiveRecord::Base

  belongs_to :picture

  validates :name, :uniqueness =>  true, :presence => true

end
