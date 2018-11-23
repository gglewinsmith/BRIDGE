class CvUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
