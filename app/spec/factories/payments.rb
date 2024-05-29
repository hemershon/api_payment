FactoryBot.define do
  factory :payment do
    card_holder_name { "Hemershon Silva" }
    card_number { "1234567812345678" }
    expiration_date { "12/25" }
    cvv { "123" }
    amount { 100.0 }
    status { "pending" }
    association :user
  end
end
