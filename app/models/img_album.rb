class ImgAlbum < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true
  validates :name, presence: true, length: {minimum: 5, maximum: 200}, uniqueness: true
  
  def photos_for_form
    collection = photos.where(img_album_id: id)
    collection.any? ? collection : photos.build
  end
end
