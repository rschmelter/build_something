class ProjectMaterial < ActiveRecord::Base 
  belongs_to :project
  belongs_to :material



def self.material_id_count 
  self.group(:material_id).count
end 

def self.most_common_material_id
  id = self.material_id_count.sort_by{|k, v| v}
  id.last[0]
end 

def self.tools
  tools = []
  self.material_id_count.each do |kv|
    m = Material.find(kv[0])
    if m.tool
      tools << m 
    end 
  end
end

end