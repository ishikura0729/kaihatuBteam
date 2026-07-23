class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


  private


    def require_login
        unless current_user
             redirect_to login_path, alert: "ログインしてください。"
        end
    end

    def manager_only
        unless current_user&.role == 1
            redirect_to announcements_path, alert: "権限がありません。"
        end
    end

end

 