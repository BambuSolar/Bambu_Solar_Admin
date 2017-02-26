class Product < ActiveRecord::Base

  belongs_to :picture

  belongs_to :product_type

  validates :name, :uniqueness =>  true, :presence => true

end
