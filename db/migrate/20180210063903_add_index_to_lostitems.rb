class AddIndexToLostitems < ActiveRecord::Migration[5.0]
  def change
    change_column :lostitems, :id_number, :string, unique: true
  end
end
