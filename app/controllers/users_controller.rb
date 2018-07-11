class UsersController < ApplicationController 
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index 
    @users = User.all

  end

  def show     

  end

  def projects
    user = User.find(params[:id])
    @projects = user.projects

  end

  def new 
    @user = User.new

  end 

  def create 
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

  def destroy 
    session.clear
    @user.destroy
    redirect_to root_path


  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:name, :password)

  end

end