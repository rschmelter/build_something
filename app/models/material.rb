class Material < ActiveRecord::Base 
  has_many :project_materials
  has_many :projects, :through => :project_materials

  accepts_nested_attributes_for :project_materials
end