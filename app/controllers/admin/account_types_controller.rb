class Admin::AccountTypesController < ApplicationController
  def index
    @account_types = AccountType.all
  end

  def show
    @account_type = AccountType.find(params[:id])
  end

  def new
    @account_type = AccountType.new
  end

  def create
    @account_type = AccountType.new(params[:account_type])
    if @account_type.save
      redirect_to [:admin, @account_type], :notice => "Successfully created account type."
    else
      render :action => 'new'
    end
  end

  def edit
    @account_type = AccountType.find(params[:id])
  end

  def update
    @account_type = AccountType.find(params[:id])
    if @account_type.update_attributes(params[:account_type])
      redirect_to [:admin, @account_type], :notice  => "Successfully updated account type."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @account_type = AccountType.find(params[:id])
    @account_type.destroy
    redirect_to admin_account_types_url, :notice => "Successfully destroyed account type."
  end
end
