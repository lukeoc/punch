class AddGooglePlaceIdToMerchants < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :google_place_id, :string
  end
end
