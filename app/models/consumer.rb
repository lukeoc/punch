class Consumer < ApplicationRecord
  has_many :transactions
  has_many :cards
  has_many :merchants, through: :cards

  has_secure_password
end
