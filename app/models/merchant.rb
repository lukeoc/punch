class Merchant < ApplicationRecord
  has_many :transactions
  has_many :cards
  has_many :consumers, through: :cards
end
