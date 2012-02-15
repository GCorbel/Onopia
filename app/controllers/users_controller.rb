# encoding: UTF-8

class UsersController < ApplicationController
  
  def create
    @user = User.new(params[:user])
    
    if (ENV["RAILS_ENV"] == "test" and @user.save) or @user.save_with_captcha
      UserMailer.activation(@user).deliver
    else
      render :new
    end
  end
  
  def destroy
    @current_user_session.destroy
    @current_user.destroy
    redirect_to login_path, :notice => "Votre compte à été supprimé"
  end
  
  def update
    @user = User.find(params[:id])
      
    unless @user.update_attributes(params[:user])
      render :edit
    end
  end
  
  def update_theme
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to configuration_path
  end
  
  def amounts
    @date_start = Date.parse(params[:stats][:date_start])
    @date_end = Date.parse(params[:stats][:date_end])
    @options = {}
    @options = params[:stats][:options] if params[:stats][:options]
    data = @current_user.amounts(@date_start, @date_end, @options)
    render :json => data
  end
  
  def records
    query = @current_user.records.joins(:category)
                         .select("records.*, categories.label as category_label")
                         
    if params[:search]
      params_search = params[:search]
    else
      params_search = {}
    end
    
    if params[:sSearch]
      where = "records.label like '%#{params[:sSearch]}%'"
      where+= " OR categories.label like '%#{params[:sSearch]}%'"
      where+= " OR date like '%#{params[:sSearch]}%'"
      query = query.where(where)
    end
    
    iTotalDisplayRecords = query.search(params_search).size
    iTotalRecords = @current_user.records.all.size
    
    offset = params[:iDisplayStart].to_i / params[:iDisplayLength].to_i
    query = query.offset(offset).limit(params[:iDisplayLength])
    
    case params[:iSortCol_0]
      when "0"
        order = "date"
      when "1"
        order = "label"
      when "2"
        order = "amount"
      when "3"
        order = "category_label"
    end
    
    if order
      order += " #{params[:sSortDir_0]}"
      query = query.order(order)
    end
    
    records = query.search(params_search)
    
    array_categories = Category.all.collect
    result = records.all.collect{ |record|
      category = ApplicationController.helpers.category_for_record(
        record.category, record, array_categories
      )
      [record.date,record.label,record.amount, category, record.id]
    }
                    
    render :json => {
      :sEcho => params[:sEcho],
      :iTotalRecords => iTotalRecords,
      :iTotalDisplayRecords => iTotalDisplayRecords,
      :aaData => result
    }
  end
end
