class AddUserIdToUsersfoundidContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :usersfoundid_contacts, :user_id, :integer
  end
end
