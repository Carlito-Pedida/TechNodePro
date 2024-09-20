class SessionsController < ApplicationController

    def New

    end

    def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
        flash[:notice] = "Logged in successfully"
        redierect_to user
       else
        flash.now[:alert] = "Invalid login credentials"
        render "new"
       end
    end

    def destroy
    end

end