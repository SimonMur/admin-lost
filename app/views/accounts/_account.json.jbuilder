json.extract! account, :id, :user_id, :balance, :meta, :meta_name, :created_at, :updated_at
json.url account_url(account, format: :json)
