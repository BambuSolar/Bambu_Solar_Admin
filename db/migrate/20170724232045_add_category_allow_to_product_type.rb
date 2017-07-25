class AddCategoryAllowToProductType < ActiveRecord::Migration
  def change

    add_column :product_types, :allow_category, :boolean

  end
end
