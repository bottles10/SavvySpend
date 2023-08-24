class Income < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true, numericality: { greater_than: 10 }
end
