class UsersController < ApplicationController
    before_action :set_user, only: [ :show, :edit, :update, :destroy ]
    before_action :require_user, only: [ :edit, :update ]
    before_action :require_same_user, only: [ :edit, :update, :destroy ]

    def show
        @articles = @user.articles
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 4)
    end


    def new
        @user = User.new
    end

    def edit
    end

    def update
        if @user.update(user_params)
           flash[:notice] = "Your account was updated successfully"
           redirect_to @user
        else
            render "new"
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "New account created. Welcome to Technode Pro #{@user.first_name}!"
            redirect_to user_path(@user)
        else
            render "new"
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account and all associated articles deleted!"
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :user_image)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] = "You are not allowed to perform this operation"
            redirect_to @user
        end
    end
end
