class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :period
      t.decimal :amount, :precision => 2
      t.integer :user_id
      t.integer :category_id
      
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
