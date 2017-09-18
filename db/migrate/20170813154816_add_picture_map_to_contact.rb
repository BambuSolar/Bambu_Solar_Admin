class AddPictureMapToContact < ActiveRecord::Migration
  def change
    add_column :contact_infos, :picture_id, :integer, index: true, foreign_key: true
  end
end
