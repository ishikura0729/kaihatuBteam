class SessionsController < ApplicationController
  def new
  end

  def create
    login_id = params[:login_id].to_s.strip

    user = User.find_by(login_id: login_id)

    if user.present?
      session[:user_id] = user.id
      redirect_to shifts_path
    else
      flash.now[:alert] = "ログインIDが間違っています"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "ログアウトしました"
  end
end
