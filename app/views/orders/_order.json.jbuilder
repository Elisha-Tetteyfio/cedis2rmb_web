json.extract! order, :id, :user_id, :amount, :rate, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
