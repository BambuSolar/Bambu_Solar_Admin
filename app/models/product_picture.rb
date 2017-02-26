class ProductPicture < ActiveRecord::Base

  belongs_to :picture

  belongs_to :product

end
