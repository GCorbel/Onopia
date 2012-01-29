# encoding: UTF-8
class AccountsController < ApplicationController

  respond_to :js
  def new
    @account = Account.new
    @account.bank_id = params[:bank_id]
  end

  def create
    @account = Account.new(params[:account])
    @account.user_id = current_user.id
    unless @account.save
      render :new
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
  end
end
