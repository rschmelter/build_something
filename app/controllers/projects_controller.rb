class ProjectsController < ApplicationController 
  before_action :set_project, only: [:show, :update, :edit, :destroy]

  
  def index 

  end 
  
  def new 
    @project = Project.new(user_id: params[:user_id])
    @materials = 10.times {@project.project_materials.build}
  end 

  def show 
  

  end

  def create     
    project = current_user.projects.new(project_params)
    if project.save
      project.add_materials(project_materials_params)
      redirect_to user_project_path(current_user.id, project.id)
    else 
      @project = Project.new
      redirect_to new_project_path
    end
  end

  def edit 
    @materials = 10.times{@project.project_materials.build}

  end

  private 

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