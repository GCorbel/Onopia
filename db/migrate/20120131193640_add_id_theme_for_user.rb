class AddIdThemeForUser < ActiveRecord::Migration
  def up
    add_column :users, :theme_id, :integration
  end

  def down
    remove_column :users, :theme_id
  end
end
