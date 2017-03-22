class Card < ApplicationRecord
  belongs_to :consumer
  belongs_to :merchant
  has_many :transactions

  def current_total
    total = 0
    transactions.each do |transaction|
      total += transaction.amount
    end
    return total
  end

  def reward_progress
    current_total = self.current_total
    reward_threshold = self.merchant.reward_threshold
    reward_progress = current_total / reward_threshold
    return reward_progress
  end
end
