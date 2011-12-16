class UserActivatesController < ApplicationController
  def new
    user = User.find_by_perishable_token(params[:id])
    if user
      user.active = true
      user.reset_perishable_token
      user.save
      redirect_to(login_path, :notice => t("user_activated", :scope => "user_activates.controller"))
    else
      redirect_to(login_path, :notice => t("error", :scope => "user_activates.controller"))
    end
  end
end
