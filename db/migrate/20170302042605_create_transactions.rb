class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :consumer_id
      t.integer :merchant_id
      t.integer :card_id
      t.integer :amount

      t.timestamps
    end
  end
end
