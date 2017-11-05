class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :from_id
      t.integer :to_id
      t.boolean :deposit
      t.boolean :withdrawal
      t.decimal :amount

      t.timestamps
    end
  end
end
