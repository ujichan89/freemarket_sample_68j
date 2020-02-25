class Item < ApplicationRecord
  has_many :images
  # accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :brand

  validates_associated :images

end
