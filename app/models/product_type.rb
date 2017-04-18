class ProductType < ActiveRecord::Base

  belongs_to :picture

  validates :name, presence: true
  validates :order, :uniqueness =>  true, :presence => true

end
