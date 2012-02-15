class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :label
      t.decimal :amount, :precision => 8, :scale => 2
      
      t.belongs_to :record
      t.belongs_to :user
      t.belongs_to :category
      t.belongs_to :account
      
      t.timestamps
    end
  end
end
