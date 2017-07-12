class CreateRibbons < ActiveRecord::Migration
  def change
    create_table :ribbons do |t|
      t.string :text
      t.string :link
      t.references :picture, index: true, foreign_key: true
      t.integer :order
      t.timestamps null: false
    end
  end
end
