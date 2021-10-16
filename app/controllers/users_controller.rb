class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]
    def new
        if current_user&.is_admin 
          @user = User.new
        elsif current_user ==nil
          @user = User.new
        else
          redirect_to tasks_path
        end
      end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to tasks_path
        else
            render :new, notice: 'Account creation fails'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
