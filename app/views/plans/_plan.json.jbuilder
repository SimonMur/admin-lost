json.extract! plan, :id, :name, :cost, :duration, :support, :admin_panel, :lost_id_alerts, :reported_id_alerts, :created_at, :updated_at
json.url plan_url(plan, format: :json)
