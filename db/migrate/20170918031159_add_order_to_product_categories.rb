class AddOrderToProductCategories < ActiveRecord::Migration
  def change

    add_column :product_categories, :order, :integer

  end
end
