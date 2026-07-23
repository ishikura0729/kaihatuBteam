class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login_id: params[:login_id])

    if user
      session[:user_id] = user.id
      redirect_to announcements_path
    else
      flash[:alert] = "ログインIDが違います"
      render :new
    end
  end
end