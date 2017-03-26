class AddLatToMerchant < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :lat, :integer
  end
end
