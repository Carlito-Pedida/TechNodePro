module ApplicationHelper


    def current_user
        if session[:user_id]
            User.find(session[:user_id])
    end

    def logged_in?
    end

end
