class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday_year, :birthday_month, :birthday_day, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # validates :family_name, presence: true, format: { with: /[\p{hiragana} ー－]+/ }
  # validates :first_name, presence: true, format: { with: /[\p{hiragana} ー－]+/ }
  validates :family_furigana, presence: true, format: { with: /[\p{katakana} ー－]+/ }
  validates :first_furigana, presence: true, format: { with: /[\p{katakana} ー－]+/ }
  has_one :address
end

