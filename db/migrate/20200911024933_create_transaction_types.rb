class CreateTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_types do |t|
      t.string :name, null: false
      t.string :signal, null: false

      t.timestamps
    end

    add_index :transaction_types, [:name, :signal], :unique => true
  end
end
