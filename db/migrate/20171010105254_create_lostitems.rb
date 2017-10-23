class CreateLostitems < ActiveRecord::Migration[5.0]
  def change
    create_table :lostitems do |t|
      t.references :type, foreign_key: true
      t.string :name
      t.string :id_number
      t.string :pp_number
      t.string :reg_number
      t.string :other_number
      t.datetime :date_of_birth
      t.references :county, foreign_key: true
      t.string :location
      t.datetime :date_found
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
