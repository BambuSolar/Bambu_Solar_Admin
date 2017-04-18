class AddOrderToProductTypes < ActiveRecord::Migration
  def change

    add_column :product_types, :order, :integer

  end
end
