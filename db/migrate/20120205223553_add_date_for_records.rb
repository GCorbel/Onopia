class AddDateForRecords < ActiveRecord::Migration
  def up
    add_column :records, :date, :date
  end

  def down
    remove_column :records, :date, :date
  end
end
