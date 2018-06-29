class Project < ActiveRecord::Base 
  belongs_to :user
  has_many :project_materials
  has_many :materials, :through => :project_materials

  accepts_nested_attributes_for :materials
  accepts_nested_attributes_for :project_materials



  def add_materials 
    # params[:project][project_materials].values. each do |project_material|



  end

end