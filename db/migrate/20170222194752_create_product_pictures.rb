class CreateProductPictures < ActiveRecord::Migration
  def change
    create_table :product_pictures do |t|

      t.references :product, index: true, foreign_key: true
      t.references :picture, index: true, foreign_key: true
      t.timestamps null: false

    end
  end
end
