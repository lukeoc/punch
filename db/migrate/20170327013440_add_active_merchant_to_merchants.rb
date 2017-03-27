class AddActiveMerchantToMerchants < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :active_merchant, :boolean
  end
end
