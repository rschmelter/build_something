class ProjectsController < ApplicationController 
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  
  def index 

  end 
  
  def new 
    @project = Project.new(user_id: params[:user_id])
    @materials = 10.times {@project.project_materials.build}
  end 

  def show 
  

  end

  def create 
 

  end

  private 

  def set_project 
    @project = Project.find(params[:id])

  end

  def project_params 
    params.require(:project).permit(:name, :cost, :difficulty, :project_type, :user_id)

  end

  def project_materials_params
    params.require(:project).permit(project_materials_attributes: [:quantity, :material_id, material:[:name], material:[:tool]])
  end



end