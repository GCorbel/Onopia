class ChangeAccountTypeColumnForAccount < ActiveRecord::Migration
  def up
    remove_column :accounts, :account_type_id, :integer
    add_column :accounts, :type_id, :integer
  end

  def down
    remove_column :accounts, :type_id, :integer
    add_column :accounts, :account_type_id, :integer
  end
end
