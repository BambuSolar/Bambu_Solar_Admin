class AddLinkToMapContact < ActiveRecord::Migration
  def change
    add_column :contact_infos, :link_to_map, :string
  end
end
