class UsersController < ApplicationController 
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index 
    @users = User.all

  end

  def show     

  end

  def projects    
    @user = User.find(params[:id])
    @projects = @user.projects
    render json: @projects
  end

  def manage 

  end 

  def new 
    if current_user
      redirect_to user_path(current_user)
    else 
      @user = User.new
    end
  end 

  def edit 
    redirect_to user_path(current_user) unless @user.id == current_user.id
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

  def update 
    if @user.update(user_params)
      redirect_to user_path(@user)
    else 
      render :edit
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