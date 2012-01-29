class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :login
      t.string :password
      t.decimal :balance, :precision => 2
      
      t.belongs_to :user
      t.belongs_to :bank
      t.belongs_to :account_type

      t.timestamps
    end
  end
end
