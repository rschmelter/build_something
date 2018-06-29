class ProjectsController < ApplicationController 
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  
  def index 

  end 
  
  def new 
    @project = Project.new(user_id: params[:user_id])
    @materials = 15.times.collect {@project.project_materials.build}
  end 

  def show 
  

  end

  def create 
   
    project = current_user.projects.new(project_params)
      if project.save 
        binding.pry
        project.add_materials(project_materials_params)
    
      end

  end

  private 

  def set_project 
    @project = Project.find(params[:id])

  end

  def project_params 
    params.require(:project).permit(:name, :cost, :difficulty, :project_type, :user_id)

  end

  def project_materials_params
    params.require(:project).permit(project_materials_attributes: [:quantity, :size, :material_id)
  end



end