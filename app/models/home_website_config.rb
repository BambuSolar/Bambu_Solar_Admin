class HomeWebsiteConfig < ActiveRecord::Base

  belongs_to :horizontal_picture, :class_name => 'Picture'
  belongs_to :vertical_picture, :class_name => 'Picture'

end
