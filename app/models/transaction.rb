class Transaction < ApplicationRecord
  belongs_to :consumer
  belongs_to :merchant
  belongs_to :card
end
