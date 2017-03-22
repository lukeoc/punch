class AddAddedPlaidToConsumer < ActiveRecord::Migration[5.0]
  def change
    add_column :consumers, :added_plaid, :boolean
  end
end
