class AddStatusToLostitems < ActiveRecord::Migration[5.0]
  def change
    add_column :lostitems, :status, :boolean, default: true
  end
end
