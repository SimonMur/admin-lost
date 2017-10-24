class AddPictureToLostitems < ActiveRecord::Migration[5.0]
  def change
    add_column :lostitems, :picture_front, :string
    add_column :lostitems, :picture_back, :string
    add_column :lostitems, :county_born, :string
  end
end
