class CreateHomeWebsiteConfigs < ActiveRecord::Migration
  def change
    create_table :home_website_configs do |t|
      t.integer :horizontal_picture_id , index: true, foreign_key: true
      t.integer :vertical_picture_id, index: true, foreign_key: true
      t.text :welcome_message
      t.timestamps null: false
    end
  end
end
