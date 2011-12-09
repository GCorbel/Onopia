class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.decimal :real, :precision => 2
      t.decimal :virtual, :precision => 2

      t.timestamps
    end
  end
end
