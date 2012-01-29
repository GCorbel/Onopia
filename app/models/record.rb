class Record < ActiveRecord::Base
  belongs_to :account
  belongs_to :balance
  belongs_to :category
  belongs_to :project
  
  #madeleine is used to store information about baysian system
  #you can show informations at this page :
  #http://rubydoc.info/gems/madeleine/0.7.3/frames
  @@madeleine = nil
  
  def self.madeleine= madeleine
    @@madeleine = madeleine
  end
  
  #Madeleine should be initialized only one time
  def self.madeleine
    unless @@madeleine
      @@madeleine = SnapshotMadeleine.new("bayes_data") {
          Classifier::Bayes.new
      }
      Category.all.each do | category |
        @@madeleine.system.add_category(category.label)
      end
    end
    @@madeleine
  end
  
  #Store the data
  def self.store_madeleine
    Record.madeleine.take_snapshot
  end
  
  #train the baysian system with the category and the label's record
  def train_for(category)
    if self.category && self.label
      Record.madeleine.system.train(self.category.label, self.label)
    end
    self.category = category
  end
  
  #If there is any category registered we search it from the baysian system
  def category
    category_id = read_attribute(:category_id)
    if category_id
      category = Category.find(category_id)
    else
      if self.label
        category_label = Record.madeleine.system.classify(self.label)
        category = Category.find_by_label(category_label)
      end
    end
    category
  end
end
