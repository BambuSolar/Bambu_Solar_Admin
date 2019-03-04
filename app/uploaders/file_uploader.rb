# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file

  if ENV['RAILS_ENV'] == 'production'
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    (ENV['RAILS_ENV'] == 'production') ?
        "#{Rails.env}/uploads/#{model.class.to_s.underscore}/#{model.id}" :
        "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{model.id}"

  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    # "#{secure_token}.#{file.extension}" if original_filename.present?
    I18n.transliterate(original_filename) if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
