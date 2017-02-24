class Picture < ActiveRecord::Base
  mount_uploader :photo, PictureUploader

  validates :photo, :presence => true

end
