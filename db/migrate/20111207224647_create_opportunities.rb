class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :from
      t.string :subject
      
      t.belongs_to :user

      t.timestamps
    end
  end
end
