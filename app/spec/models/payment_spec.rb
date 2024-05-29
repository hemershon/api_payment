require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    payment = Payment.new(
      card_holder_name: 'Hemershon Silva',
      card_number: '1234567812345678',
      expiration_date: '12/25',
      cvv: '123',
      amount: 100.0,
      status: 'pending',
      user: user
    )
    expect(payment).to be_valid
  end

  it 'is not valid without a card_holder_name' do
    payment = Payment.new(card_holder_name: nil, user: user)
    expect(payment).to_not be_valid
  end

  it 'is not valid without a card_number' do
    payment = Payment.new(card_number: nil, user: user)
    expect(payment).to_not be_valid
  end

  it 'is not valid without an expiration_date' do
    payment = Payment.new(expiration_date: nil, user: user)
    expect(payment).to_not be_valid
  end

  it 'is not valid without a cvv' do
    payment = Payment.new(cvv: nil, user: user)
    expect(payment).to_not be_valid
  end

  it 'is not valid without an amount' do
    payment = Payment.new(amount: nil, user: user)
    expect(payment).to_not be_valid
  end

  it 'is not valid without a status' do
    payment = Payment.new(status: nil, user: user)
    expect(payment).to_not be_valid
  end

  it 'is not valid without a user' do
    payment = Payment.new(
      card_holder_name: 'Hemershon Silva',
      card_number: '1234567812345678',
      expiration_date: '12/25',
      cvv: '123',
      amount: 100.0,
      status: 'pending',
      user: nil
    )
    expect(payment).to_not be_valid
  end
end
