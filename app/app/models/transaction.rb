class Transaction < ApplicationRecord
  before_validation :generate_transaction_id, on: :create

  validates :cardholder_name, :credit_card_number, :transaction_value, :expiration_date, :cvv, presence: true

  private

  def generate_transaction_id
    self.transaction_id = SecureRandom.uuid
  end
end
