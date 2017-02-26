class Picture < ActiveRecord::Base
  mount_uploader :photo, PictureUploader

end
