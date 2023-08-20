class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.decimal :amount
      t.string :time_period
      t.index [:user_id, :budget_id]

      t.timestamps
    end
  end
end
