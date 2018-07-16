class Material < ActiveRecord::Base 
  has_many :project_materials
  has_many :projects, :through => :project_materials

  

  def self.tool 
    where(tool: true)
  end

  def self.raw_material
    where(tool: false)
  end 

end