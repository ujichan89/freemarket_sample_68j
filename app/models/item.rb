class Item < ApplicationRecord
  has_many :images
  belongs_to :brand
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true

  validates_associated :images
end
