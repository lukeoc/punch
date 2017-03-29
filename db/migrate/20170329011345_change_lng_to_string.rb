class ChangeLngToString < ActiveRecord::Migration[5.0]
  def change
    change_column :merchants, :lng, :string
  end
end
