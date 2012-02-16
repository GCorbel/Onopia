class AddIdThemeForUser < ActiveRecord::Migration
  def up
    add_column :users, :theme_id, :integer
  end

  def down
    remove_column :users, :theme_id
  end
end
