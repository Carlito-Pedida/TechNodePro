class SessionsController < ApplicationController

    def New

    end

    def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully"
        redirect_to user
       else
        flash.now[:alert] = "Invalid login credentials"
        render :new, status: :unprocessable_entity
       end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
    end

end