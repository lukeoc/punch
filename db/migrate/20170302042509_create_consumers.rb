class CreateConsumers < ActiveRecord::Migration[5.0]
  def change
    create_table :consumers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :phone

      t.timestamps
    end
  end
end
