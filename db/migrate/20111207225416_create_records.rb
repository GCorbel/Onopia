class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :label
      t.decimal :amount, :precision => 2
      t.boolean :credit
      t.boolean :splitted
      t.string :code
      t.decimal :balance, :precision => 2
      t.boolean :virtual
      
      t.belongs_to :record
      t.belongs_to :user
      t.belongs_to :category
      t.belongs_to :account
      t.belongs_to :project
      
      t.timestamps
    end
  end
end
