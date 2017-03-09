class ChangePhoneToString < ActiveRecord::Migration[5.0]
  def change
    change_column :consumers, :phone, :string
  end
end
