class ProjectsController < ApplicationController 
  
  before_action :validate_user_project, only: [:show, :edit]
  before_action :set_project, only: [:show, :update, :edit, :destroy]
  
  def index 
    @projects = Project.all
  end 
  
  def new  
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil? || user.id != current_user.id
        redirect_to user_path(current_user)
      else
       @user = current_user
       @project = @user.projects.build
       @materials = 10.times {@project.project_materials.build}
      end 
    end
  end 

  def show    

  end

  def create       
    @project = current_user.projects.new(project_params)
    if @project.save
      @project.add_materials(project_materials_params)
      redirect_to user_project_path(current_user.id, @project.id)
    else 
      @materials = 10.times {@project.project_materials.build}
      render :new
    end
  end

  def edit 
      @materials = 10.times{@project.project_materials.build}   

  end

  def update 
    if @project.update(project_params)
      @project.add_materials(project_materials_params)
      redirect_to user_project_path(current_user.id, @project.id)
    else 
      @materials = 10.times {@project.project_materials.build}
      render :new
    end
  end

  def destroy 
    @project.destroy
    redirect_to user_path(current_user)
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
    params.require(:project).permit(:name, :cost, :difficulty, :project_type, :instructions, :user_id)

  end

  def project_materials_params
    params.require(:project).permit(project_materials_attributes: [:quantity, :size, :material_id, material:[:material_name, :tool]])
  end



end