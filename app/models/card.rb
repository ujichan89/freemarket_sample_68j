class Card < ApplicationRecord

  belongs_to :user
  # validates :user_id, uniquness: { scope: [:customer_id, :card_id] }
end
