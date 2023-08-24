class User < ApplicationRecord

  has_many :budgets, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_one :income, dependent: :destroy

  validates :email, uniqueness: true
  validates :username, presence: true,  uniqueness: true, length: { within: 2..15 }
  validates :first_name, presence: true
  validates :last_name,  presence: true

  after_save :logins_verify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable



  # Sum user's total expenses
  def total_expenses
   current_user_expenses_arr =  expenses.map{ |user_expenses| user_expenses.amount }
   current_user_expenses_arr.sum.to_f
  end

  def user_income
    income.amount.to_f
  end
  def current_balance
    user_income - total_expenses
  end
  
  # get Savings goals by Subtracting current balance from income 
  # if total expenses is more than current balance
  # else divide current balance by income and multiply by 100 for percentage
  def savings_goals
    savings =  total_expenses > current_balance ? user_income - current_balance : (current_balance / user_income) * 100
    savings.to_i
  end

  def no_savings_left?
    savings_goals.negative?
  end

  def should_lower_spending
    sixty_of_income = user_income * 0.6
    return unless no_savings_left? || 0
    current_balance <= sixty_of_income
  end

  def expenses_label
    expenses.map{ |exp| exp.category }
  end

  

  private

  def logins_verify
    logger.debug("*****Password #{password}")
  end
end