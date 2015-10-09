class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user, only: [:edit, :update, :destroy, :show]

  def index
    redirect_to root_path unless current_user.role == 0

    if params[:role]
      @users = User.where(role: params[:role])
    else
      @users = User.all
    end
    
  end

  # Create new users
  def new
    @user = User.new
  end

  def create
    redirect_to root_path unless current_user.role != 0

    @user = User.create(user_params)
    if @user.save
      redirect_to root_path
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
    params.require(:user).permit(:name, :email, :encrypted_password, :password, :password_confirmation, :role)
  end
end