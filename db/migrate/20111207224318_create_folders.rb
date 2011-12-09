class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :label
      t.string :icon

      t.timestamps
    end
  end
end
