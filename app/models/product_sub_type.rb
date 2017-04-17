class ProductSubType < ActiveRecord::Base
  belongs_to :product_type
  validates :name, :uniqueness =>  true, :presence => true
end
