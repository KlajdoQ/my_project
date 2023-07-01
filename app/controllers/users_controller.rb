class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        render json: @users
    end

    def show 
        @users = User.find(params[:id])
        render json: @users
    end

    def create 
        @users = User.new(user_params)
        if @users.save 
            render json: @users, status: :created
        else 
            render json: {errors: @users.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update 
        @users = User.find(params[:id])
        if @users.update(user_params)
            render json: @users, status: :ok
        else 
            render json: {errors: @users.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @users = User.find(params[:id])
        if @users.destroy
            render json: "User was deleted"
        else
            render json: {errors: @users.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private 
    def user_params
        params.require(:user).permit(:name, :email, :encrypted_password)
    end
end
