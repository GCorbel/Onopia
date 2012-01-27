# encoding: UTF-8
class AccountsController < ApplicationController

  respond_to :js
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    unless @account.save
      render 'new'
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      redirect_to @account, :notice  => "Votre compte a été correctement modifié."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to accounts_url, :notice => "Votre compte a été correctement supprimé."
  end
end
