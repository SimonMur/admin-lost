class CreateCounties < ActiveRecord::Migration[5.0]
  def change
    create_table :counties do |t|
      t.string :name
      t.string :county_code
      t.string :description

      t.timestamps
    end
  end
end
