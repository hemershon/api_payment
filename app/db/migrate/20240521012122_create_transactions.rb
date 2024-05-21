class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :cardholder_name
      t.string :credit_card_number
      t.decimal :transaction_value
      t.date :expiration_date
      t.string :cvv
      t.string :transaction_id
      t.string :status

      t.timestamps
    end
  end
end
