class CreateGeneralInformations < ActiveRecord::Migration
  def change
    create_table :general_information do |t|
      t.string :demonstrative_video
      t.string :catalog

      t.timestamps null: false
    end
  end
end
