class AddYoutubeUrlToProduct < ActiveRecord::Migration
  def change

    add_column :products, :url_video_youtube, :string

  end
end
