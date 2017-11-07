class CreateAgentrs < ActiveRecord::Migration[5.0]
  def change
    create_table :agentrs do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
