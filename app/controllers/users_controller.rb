class UsersController < ApplicationController

    def index 
        @users = User.all
     end

     def show 
        @user = User.find(params[:id])
     end
 

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            redirect_to @user
        else 
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "User was edited!"
            redirect_to articles_path
        else 
            render "edit"
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password_digest)
    end

end