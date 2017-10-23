class AddNoticeToNotifications < ActiveRecord::Migration
  def change
    add_column :users, :notice_type, :string
   
   
  end
end