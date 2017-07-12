class CreateSocialNetworks < ActiveRecord::Migration
  def change
    create_table :social_networks do |t|
      t.string :name
      t.string :link
      t.string :icon
      t.integer :order

      t.timestamps null: false
    end
  end
end
