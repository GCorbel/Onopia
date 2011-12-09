class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      
      t.belongs_to :user
      t.belongs_to :bank
  
      t.timestamps
    end
  end
end
