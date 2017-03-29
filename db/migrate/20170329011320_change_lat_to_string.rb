class ChangeLatToString < ActiveRecord::Migration[5.0]
  def change
    change_column :merchants, :lat, :string
  end
end
