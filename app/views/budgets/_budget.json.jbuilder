json.extract! budget, :id, :user_id, :category, :amount, :time_period, :created_at, :updated_at
json.url budget_url(budget, format: :json)
