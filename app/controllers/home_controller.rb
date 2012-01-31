class HomeController < ApplicationController

  before_filter :redirect_if_logout, :only => :index
  before_filter :redirect_if_logged, :only => :login
  def index
  end
  
  def login
    @user = User.new
    @user_session = UserSession.new
  end

end
