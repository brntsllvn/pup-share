class PupPicUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  process resize_to_fill: [75, 75]

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if no file uploaded
  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "pup_walk.png"].compact.join('_'))
  end

  # Process files as they are uploaded:
  #   process :resize_to_fit => [200, 200]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
