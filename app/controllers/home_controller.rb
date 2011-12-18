class HomeController < ApplicationController

  before_filter :redirect_logout
  def index    
    @user = User.new
  end

end
