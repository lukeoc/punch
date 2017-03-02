class Card < ApplicationRecord
  belongs_to :consumer
  belongs_to :merchant
  has_many :transactions
end
