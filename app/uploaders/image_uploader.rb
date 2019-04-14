class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def size_range
    1..5.megabytes
  end
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [300, 300]

  def extension_whitelist
     %w(jpg jpeg gif png)
  end

end
