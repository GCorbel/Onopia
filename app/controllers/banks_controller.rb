class BanksController < ApplicationController
  respond_to :html, :js
  def index
    @bank = Bank.new(params[:bank])
    if @bank.label
      if @bank.label.size == 1
        search = "#{@bank.label}%"
      else
        search = "%#{@bank.label}%"
      end
      @banks = Bank.where("label like ?", search)
    else 
      @banks = []
    end
  end
end
