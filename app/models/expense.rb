class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :budget, optional: true



  def has_budget?
    budget_id.present?
  end
end
