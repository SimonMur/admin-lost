class AddPriceToTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :types, :price, :string
  end
end
