class ProductSubType < ActiveRecord::Base
  belongs_to :product_type
  has_many :product_category_product_sub_types, :dependent => :delete_all
  validates :name, :uniqueness =>  true, :presence => true
end
