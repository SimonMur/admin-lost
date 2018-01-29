class AddDistrictIdToLostitems < ActiveRecord::Migration[5.0]
  def change
    add_column :lostitems, :district_id, :integer
  end
end
