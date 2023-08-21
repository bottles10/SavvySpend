class User < ApplicationRecord

  has_many :budgets, dependent: :destroy
  has_many :expenses, dependent: :destroy

  validates :email, uniqueness: true
  validates :username, presence: true,  uniqueness: true, length: { within: 2..15 }
  validates :first_name, presence: true
  validates :last_name,  presence: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
