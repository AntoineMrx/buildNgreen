# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit 800, 600
  end

  version :preview do
    resize_to_fit 200, 200

  end

  version :thumbnail do
    cloudinary_transformation effect: "brightness:30",
      width: 100, height: 100, crop: :thumb, gravity: :face
  end
end
