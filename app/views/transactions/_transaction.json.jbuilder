json.extract! transaction, :id, :from_id, :to_id, :deposit, :withdrawal, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
