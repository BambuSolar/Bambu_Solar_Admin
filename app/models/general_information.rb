class GeneralInformation < ActiveRecord::Base
  self.table_name = 'general_information'

  mount_uploader :catalog, FileUploader
end
