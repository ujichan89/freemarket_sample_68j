class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: true
  
  belongs_to :brand
  belongs_to :category
  belongs_to :user

end
