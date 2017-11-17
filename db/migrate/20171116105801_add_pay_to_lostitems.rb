class AddPayToLostitems < ActiveRecord::Migration[5.0]
  def change
    add_column :lostitems, :pay, :boolean, default: false
  end
end
