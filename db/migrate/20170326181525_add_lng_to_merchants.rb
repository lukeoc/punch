class AddLngToMerchants < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :lng, :integer
  end
end
