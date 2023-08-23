class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.index [:user_id, :income_id]


      t.timestamps
    end
  end
end
