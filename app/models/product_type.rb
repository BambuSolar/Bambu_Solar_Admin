class ProductType < ActiveRecord::Base

  belongs_to :picture

  validates :name, presence: true

end
