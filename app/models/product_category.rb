class ProductCategory < ActiveRecord::Base
  belongs_to :product_type
  has_many :product_category_product_sub_types, :dependent => :delete_all
end
