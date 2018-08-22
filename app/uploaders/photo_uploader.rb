class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  def default_public_id
    "ebhatafs9tqo8fycolwg"
  end
end
