class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :consumer_id
      t.integer :merchant_id
      t.integer :total
      t.integer :level
      t.boolean :redeemable

      t.timestamps
    end
  end
end
