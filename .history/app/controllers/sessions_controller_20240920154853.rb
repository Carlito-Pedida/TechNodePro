class SessionsController < ApplicationController

    def New

    end

    def create
       user = User.find_by(email: params[:session][:email].downcase)
    end

    def destroy
    end

end