class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :budget, optional: true

  validates :date, presence: true
  validates :amount, presence: true
  validates :category, presence: true
  validates :payment_method, presence: true

  validate :expenses_is_not_future


  def has_budget?
    budget_id.present?
  end

  private

  # Expenses date cannot be after tommorrow date
  def expenses_is_not_future
    return unless date.present?
    if self.date > Date.tomorrow
      errors.add(:date, " Expenses date cannot be future : #{date}")
    end
  end
end