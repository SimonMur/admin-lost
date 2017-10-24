class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.string :id_number

      t.timestamps
    end
  end
end
