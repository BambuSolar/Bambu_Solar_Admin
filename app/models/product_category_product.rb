class ProductCategoryProduct < ActiveRecord::Base
  belongs_to :product_sub_type
  belongs_to :product_category
end
