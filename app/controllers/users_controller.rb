class UsersController < ApplicationController
  before_filter :set_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  # Create new users
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  # Update User's information
  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user = User.find(params[:id]).update(user_params)
      redirect_to users_path
    end
  end

  # Delete User
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end

  private
  # Set user's variable
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :role)
  end
end