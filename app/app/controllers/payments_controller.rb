class PaymentsController < ApplicationController
  before_action :authorized, only: %i[index create update destroy]
  before_action :set_payment, only: %i[show update destroy]

  def create
    @payment = @user.payments.build(payment_params)
    if @payment.save
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def index
    @payments = @user.payments.all
    render json: @payments
  end

  def show
    render json: @payment
  end

  def update
    if @payment.update(status: params[:status])
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @payment.destroy
    head :no_content
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:card_holder_name, :card_number, :expiration_date, :cvv, :amount, :status)
  end
end
