class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :mobile
      t.decimal :amount
      t.decimal :agent_credit
      t.string :id_number
      t.string :user_id
      t.string :transaction_id
      t.string :status

      t.timestamps
    end
  end
end
