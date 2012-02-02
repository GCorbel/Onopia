class Admin::ThemesController < ApplicationController
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(params[:theme])
    if @theme.save
      redirect_to [:admin, @theme], :notice => "Successfully created theme."
    else
      render :action => 'new'
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    if @theme.update_attributes(params[:theme])
      redirect_to [:admin, @theme], :notice  => "Successfully updated theme."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to admin_themes_url, :notice => "Successfully destroyed theme."
  end
end
