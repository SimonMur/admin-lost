class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.decimal :balance, default: 0
      t.boolean :meta
      t.string :meta_name

      t.timestamps
    end
  end
end
