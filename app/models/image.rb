class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :picture, ImageUploader
end
