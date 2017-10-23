class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :county_id, :integer
    add_column :users, :idnumber, :string
    add_column :users, :mobilenumber, :string
    add_column :users, :question, :string
    add_column :users, :dateofbirth, :datetime
  	add_column :users, :picture, :string
  end
end