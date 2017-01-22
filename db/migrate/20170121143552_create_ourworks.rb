class CreateOurworks < ActiveRecord::Migration
  def change
    create_table :ourworks do |t|
      t.string :title
      t.references :picture, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
