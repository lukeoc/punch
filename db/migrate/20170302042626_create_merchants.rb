class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :reward_name
      t.integer :reward_threshold

      t.timestamps
    end
  end
end
