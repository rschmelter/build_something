class UsersController < ApplicationController 
  before_action :set_user, only: [:show, :projects, :edit, :update, :destroy]
  
  def index 
    @users = User.all

  end

  def show     

  end

  def projects    
    
  end

  def new 
    if current_user
      redirect_to user_path(current_user)
    else 
      @user = User.new
    end
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
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to user_path(current_user)
    else
      @projects = @user.projects     
    end
  end

  def user_params 
    params.require(:user).permit(:name, :password)

  end

end