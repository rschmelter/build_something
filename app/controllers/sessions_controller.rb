class SessionsController < ApplicationController 

  def new 
    @user = User.new

  end

  def create 
    if request.env["omniauth.auth"].present?
      @user = User.find_or_initialize_by(name: request.env["omniauth.auth"]['info']['name'])
      if @user.id.present?
        session[:user_id] = @user.id
      else 
        @user.password = SecureRandom.hex
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    end
    
    if params[:user][:name].present?
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