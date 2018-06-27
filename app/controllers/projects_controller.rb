class ProjectsController < ApplicationController 
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  
  def index 

  end 
  
  def new 
    @project = Project.new(user_id: params[:user_id])


  end 

  def show 
  

  end

  def create 
    @project = Project.create(project_params)

  end

  private 

  def set_project 
    @project = project.find(params[:id])

  end

  def project_params 
    params.require(:project).permit(:name, :cost, :difficulty, :type, :user_id)

  end




end