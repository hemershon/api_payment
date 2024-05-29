class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :card_holder_name
      t.string :card_number
      t.string :expiration_date
      t.string :cvv
      t.decimal :amount
      t.string :status

      t.timestamps
    end
  end
end
