class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def created
        byebug
    end

end
 