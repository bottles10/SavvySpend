class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :budget, null: true, foreign_key: true
      t.date :date
      t.decimal :amount
      t.string :category
      t.string :payment_method
      t.text :notes
      t.index [:user_id, :expense_id]
      t.index [:budget_id, :expense_id]

      t.timestamps
    end
  end
end
