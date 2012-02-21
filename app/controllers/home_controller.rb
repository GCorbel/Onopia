# encoding: utf-8
class HomeController < ApplicationController

  before_filter :redirect_if_logout, :only => :index
  before_filter :redirect_if_logged, :only => :login
  
  def index
    @selectedYear = "2011"
    @date_start = Date.new(2010,1,1)
    @date_end = Date.new(2010,12,31)
  end
  
  def login
    @user = User.new
    @user_session = UserSession.new
  end

end
