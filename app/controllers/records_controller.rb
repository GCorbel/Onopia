class RecordsController < ApplicationController
  def update
    record = Record.find(params[:id])
    if params[:record][:category_id]
      category = Category.find params[:record][:category_id]
      record.train_for(category)
    end
    render :nothing => true
  end

end
