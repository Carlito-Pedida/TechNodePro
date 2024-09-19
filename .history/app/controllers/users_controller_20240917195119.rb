class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.before_save
            flash[:notice] = "New account created. Welcome to Technode Pro!"
            redirect_to articles_path
        else
            render "new"
    end

end
 