class RemoveIframeFromContactAddLink < ActiveRecord::Migration
  def change
    remove_column :contact_infos, :iframe_map
  end
end
