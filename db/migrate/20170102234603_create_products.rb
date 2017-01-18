class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :description_detail
      t.float :price
      t.boolean :enabled
      t.integer :product_type_id
      t.references :picture, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
