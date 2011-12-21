class ConfigurationController < ApplicationController

  before_filter :redirect_if_logout
  def index
  end

end
