class ProjectsController < ApplicationController 
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  
  def index 

  end 
  
  def new 
    @project = Project.new(user_id: params[:user_id])


  end 

  def show 
  

  end

  def create 
    @project = Project.new(project_params)
    if @project.save
      redirect_to user_project_path(params[:project][:user_id], @project.id)
    else 
      render :new
    end

  end

  private 

  def set_project 
    @project = Project.find(params[:id])

  end

  def project_params 
    params.require(:project).permit(:name, :cost, :difficulty, :project_type, :user_id)

  end




end