# encoding: utf-8
class HomeController < ApplicationController

  before_filter :redirect_if_logout, :only => :index
  before_filter :redirect_if_logged, :only => :login
  
  def index
    @date_start = Date.new(2010,1,1)
    @date_end = Date.new(2010,12,31)
  
    options = {:type => 'incomes', :period => 'month'}
    @incomes = @current_user.amounts(@date_start, @date_end, options)
            
    options = {:type => 'expenses', :period => 'month'}
    @expenses = @current_user.amounts(@date_start, @date_end, options)  
              
    options = {:period => 'month'}
    @records = @current_user.amounts(@date_start, @date_end, options)  
         
    options = {:type => 'incomes', :group => 'category'}
    @incomes_category = (@current_user.amounts(@date_start, @date_end, options) - [0])
        
    options = {:type => 'expenses', :group => 'category'}
    @expenses_category = (@current_user.amounts(@date_start, @date_end, options) - [0])
  end
  
  def login
    @user = User.new
    @user_session = UserSession.new
  end

end
