class AddImageToMerchant < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :image, :string
  end
end
