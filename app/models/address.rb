class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates  :family_name, :first_name, :family_furigana, :first_furigana, :number, :prefecture, :municipality, :street, :building, :phone_number, presence: true
end
