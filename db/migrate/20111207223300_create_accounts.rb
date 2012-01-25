class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :login
      t.string :password
      t.integer :type_id
      t.decimal :balance, :precision => 2
      
      t.belongs_to :user
      t.belongs_to :blank
      t.belongs_to :type

      t.timestamps
    end
  end
end
