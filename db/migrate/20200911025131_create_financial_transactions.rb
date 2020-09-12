class CreateFinancialTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_transactions do |t|
      t.references :transaction_type, null: false, foreign_key: true
      t.date :transaction_date, null: false
      t.string :transaction_time, null: false
      t.integer :amount, null: false
      t.string :social_security, null: false
      t.string :card_number, null: false
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
