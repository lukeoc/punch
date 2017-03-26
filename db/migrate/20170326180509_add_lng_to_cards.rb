class AddLngToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :lng, :integer
  end
end
