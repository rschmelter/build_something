class SessionsController < ApplicationController 

  def new 
    @user = User.new

  end

  def create 
    if request.env["omniauth.auth"].present?
      @user = User.find_or_create_by(name: request.env["omniauth.auth"]["info"]["nickname"])
      if @user.id.present?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else 
        @user.password = SecureRandom.hex
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    end
    
    if params[:user].present?
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user) 
      else 
        redirect_to signin_path 
      end
    end
  end

  def destroy 
    session.clear
    redirect_to root_url
  end
  

end