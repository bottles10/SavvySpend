json.extract! expense, :id, :user_id, :budget_id, :date, :amount, :category, :payment_method, :notes, :created_at, :updated_at
json.url expense_url(expense, format: :json)
