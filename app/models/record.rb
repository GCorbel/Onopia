class Record < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  
  attr_accessible :label, :amount, :date
  
  validates :label, :presence => true
  validates :amount, :presence => true
  validates :date, :presence => true
  
  #We user Naive Bayes for the IA part
  #You can see the documentation at this address:
  #https://github.com/reddavis/Naive-Bayes
  @@bayesian_system = nil
  
  def self.bayesian_system= bayesian_system
    @@bayesian_system = bayesian_system
  end
  
  #The bayesian system should be initialized only one time
  def self.bayesian_system
    unless @@bayesian_system
      categories = Category.all.map do | category |
        category.id
      end
      @@bayesian_system = NaiveBayes.new(*categories)
      @@bayesian_system.db_filepath = 'db/baysian_system.nb'
    end
    @@bayesian_system
  end
  
  #Store the data
  def self.store_bayesian_system
    @@bayesian_system.save
  end
  
  #train the baysian system with the category and the label's record
  def train_for(category)
    if self.label
      if read_attribute(:category_id)
        begin
          Record.bayesian_system.untrain(read_attribute(:category_id), self.label)
        rescue
        end
      end
      Record.bayesian_system.train(category.id, self.label)
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
        category_id = Record.bayesian_system.classify(self.label)[0]
        category = Category.find(category_id)
      end
    end
    category
  end
end
