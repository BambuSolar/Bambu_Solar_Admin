class CreateProductCategoryProducts < ActiveRecord::Migration
  def change
    create_table :product_category_product_sub_types do |t|
      t.references :product_sub_type, index: true, foreign_key: true
      t.references :product_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
