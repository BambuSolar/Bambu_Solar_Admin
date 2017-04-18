class AddOrderToProductSubTypes < ActiveRecord::Migration
  def change

    add_column :product_sub_types, :order, :integer

  end
end
