class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :url
      t.string :title
      t.string :favicon
      
      t.belongs_to :folder

      t.timestamps
    end
  end
end
