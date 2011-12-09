class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :label
      t.string :type
      t.string :priority
      t.string :frequency
      t.string :operation
      t.decimal :amount, :precision => 2
      t.integer :category
      t.boolean :send

      t.belongs_to :user
      t.belongs_to :account
      
      t.timestamps
    end
  end
end
