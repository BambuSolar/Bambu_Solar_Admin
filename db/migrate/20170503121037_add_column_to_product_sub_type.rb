class AddColumnToProductSubType < ActiveRecord::Migration
  def change

    add_column :product_sub_types, :denomination, :string

  end
end
