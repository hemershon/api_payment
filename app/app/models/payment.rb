class Payment < ApplicationRecord
  belongs_to :user

  validates :card_holder_name, :card_number, :expiration_date, :cvv, :amount, :status, presence: true
end
