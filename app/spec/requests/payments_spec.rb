require 'rails_helper'

RSpec.describe PaymentsController, type: :request do
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:authorized_user).and_return(user)
  end

  describe 'POST #create' do
    it 'creates a new payment' do
      payment_attributes = attributes_for(:payment)
      expect {
        post payments_path, params: { payment: payment_attributes }
      }.to change(Payment, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET #index' do
    it 'returns a list of payments' do
      create_list(:payment, 3, user: user)
      get payments_path
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).length).to eq(3)
    end
  end

  describe 'GET #show' do
    it 'returns the requested payment' do
      payment = create(:payment, user: user)
      get payment_path(payment)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(payment.id)
    end
  end

  describe 'PUT #update' do
    it 'updates the payment' do
      payment = create(:payment, user: user)
      put payment_path(payment), params: { payment: { status: 'completed' } }
      expect(response).to have_http_status(:ok)
      expect(payment.reload.status).to eq('completed')
    end

    it 'returns unprocessable_entity status if payment is not updated' do
      payment = create(:payment, user: user)
      put payment_path(payment), params: { payment: { status: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the payment' do
      payment = create(:payment, user: user)
      expect {
        delete payment_path(payment)
      }.to change(Payment, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
