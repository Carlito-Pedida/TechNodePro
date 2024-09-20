class SessionsController < ApplicationController

    def New

    end

    def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
       else
        flash.now[:alert] = "Invalid login credentials"
        render "new"
    end

    def destroy
    end

end