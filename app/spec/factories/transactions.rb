FactoryBot.define do
  factory :transaction do
    cardholder_name { "MyString" }
    credit_card_number { "MyString" }
    transaction_value { "9.99" }
    expiration_date { "2024-05-21" }
    cvv { "MyString" }
    transaction_id { "MyString" }
    status { "MyString" }
  end
end
