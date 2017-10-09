class AddContractToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contract, :boolean
    add_column :users, :terms, :boolean
    add_column :users, :super_user, :boolean
  end
end