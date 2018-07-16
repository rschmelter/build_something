class ProjectsController < ApplicationController 
  
  
  before_action :validate_user_project, only: [:edit]
  before_action :set_project, only: [:show, :update, :edit, :destroy]
  before_action :require_logged_in, only: [:new, :create]
  
  def index 
    @users = User.all
    if !params[:difficulty].blank?
      if params[:difficulty] == "Easy"
        @projects = Project.order_by_easy
      else 
        @projects = Project.order_by_hard
      end
    elsif !params[:cost].blank? 
      if params[:cost] == "Low"
        @projects = Project.cheap
      else 
        @projects = Project.expensive
      end        
    else 
      @projects = Project.all
    end
  end 
  
  def new  
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil? || user.id != current_user.id
        redirect_to user_path(current_user)
      else
       @user = current_user
       @project = @user.projects.build
       10.times {@project.materials.build}
      end 
    end
  end 

  def show    

  end

  def create 
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to user_project_path(current_user.id, @project.id)
    else  

      10.times {@project.materials.build}
      render :new
    end
  end

  def edit 
    10.times {@project.materials.build}  

  end

  def update 
    if @project.update(project_params)
      redirect_to user_project_path(current_user.id, @project.id)
    else 
      10.times {@project.materials.build}
      render :new
    end
  end

  def destroy 
    if current_user.id != @project.user_id
      redirect_to user_path(current_user)
    else 
      @project.destroy
      redirect_to user_path(current_user)
    end
  end

  private 

  def validate_user_project 
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil? 
        redirect_to user_path(current_user)
      else
        @project = user.projects.find_by(id: params[:id])
      end 
    end 
    if @project.nil? || @project.user != current_user
      redirect_to user_path(current_user)
    end
  end    


  def set_project 
    @project = Project.find(params[:id])
  end

  def project_params 
    params.require(:project).permit(:name, :cost, :difficulty, :project_type, :instructions, :user_id, materials_attributes: [:material_name, :id, :tool, project_materials: [:quantity, :size]])

  end





end