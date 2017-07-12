class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :lat_map
      t.string :lon_map
      t.string :telepones
      t.string :emails
      t.string :facebook_link
      t.string :mercadolibre_link
      t.string :address_text

      t.timestamps null: false
    end
  end
end
