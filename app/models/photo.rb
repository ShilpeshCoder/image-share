class Photo < ActiveRecord::Base
  belongs_to :img_album
  mount_uploader :image, ImageUploader
end
