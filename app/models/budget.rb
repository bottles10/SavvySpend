class Budget < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :category, presence: true
  validates :amount, presence: true
  validates :time_period, presence: true
  
end