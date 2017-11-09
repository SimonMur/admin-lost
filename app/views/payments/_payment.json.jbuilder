json.extract! payment, :id, :name, :mobile, :amount, :agent_credit, :id_number, :user_id, :transaction_id, :status, :created_at, :updated_at
json.url payment_url(payment, format: :json)
