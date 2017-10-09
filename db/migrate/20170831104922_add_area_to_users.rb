class AddAreaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :area_id, :integer
   
  end
end