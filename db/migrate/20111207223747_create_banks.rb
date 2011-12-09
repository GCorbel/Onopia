class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :label
      t.string :url
      t.string :icon

      t.timestamps
    end
  end
end
