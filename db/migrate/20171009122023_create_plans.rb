class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :cost
      t.string :duration
      t.boolean :support
      t.boolean :admin_panel
      t.boolean :lost_id_alerts
      t.boolean :reported_id_alerts

      t.timestamps
    end
  end
end
