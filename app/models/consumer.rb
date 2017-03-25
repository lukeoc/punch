class Consumer < ApplicationRecord
  has_many :transactions
  has_many :cards
  has_many :merchants, through: :cards

  has_secure_password

  def cards_redeemable?
    cards.each do |card|
      if card.reward_progress > 1
        card.redeemable = true
      else
        card.redeemable = false
      end
    end
  end
end
