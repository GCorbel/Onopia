class HomeController < ApplicationController

  before_filter :redirect_if_logout
  def index    
    @user = User.new
  end

end
