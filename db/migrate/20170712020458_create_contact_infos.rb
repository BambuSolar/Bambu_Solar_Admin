class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.text :iframe_map
      t.string :telephones
      t.string :emails
      t.string :facebook_link
      t.string :mercadolibre_link
      t.string :address_text

      t.timestamps null: false
    end
  end
end
