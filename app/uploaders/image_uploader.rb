class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file


  process resize_to_fit: [800, 800]

  version :horizontal do
    process resize_to_fill: [400, 200]
  end

  version :viewer do
    process resize_to_fill: [600, 500]
  end

  version :large do
    process resize_to_fill: [600, 600]
  end

  version :thumb do
    process resize_to_fill: [300, 300]
  end

  version :small do
    process resize_to_fill: [200, 200]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    /image\//
  end

end