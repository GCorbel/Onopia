class BanksController < ApplicationController
  respond_to :html, :js
  def index
    @banks = Bank.all
  end
end
