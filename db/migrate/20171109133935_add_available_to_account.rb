class AddAvailableToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :available, :decimal
  end
end
