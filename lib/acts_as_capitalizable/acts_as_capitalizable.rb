module ActsAsCapitalizable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def acts_as_capitalizable(options = {})
    end
  end
  
  def capitalize  
    capitalized_label = ""
    label.split(" ").each do | word |
      capitalized_label += word.capitalize
    end
    capitalized_label
  end
end

ActiveRecord::Base.send :include, ActsAsCapitalizable
