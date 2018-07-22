class ProjectMaterial < ActiveRecord::Base 
  belongs_to :project
  belongs_to :material



def self.material_id_count 
  self.group(:material_id).count
end 

def self.sort_material_ids
  self.material_id_count.sort_by{|k, v| v}
  
end 

def self.tools
  tools = []
  self.sort_material_ids.each do |kv|
    m = Material.find(kv[0])
    if m.tool
      tools << m 
    end 
  end
  tools
end

def self.materials
  raw_materials = []
  self.sort_material_ids.each do |kv|
    m = Material.find(kv[0])
    if m.tool == false
      raw_materials << m 
    end 
  end
  raw_materials
end 

end