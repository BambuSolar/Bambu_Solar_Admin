class CreateProductSubTypes < ActiveRecord::Migration
  def change
    create_table :product_sub_types do |t|
      t.string :name
      t.integer :product_type_id
      t.timestamps null: false
    end
  end
end
