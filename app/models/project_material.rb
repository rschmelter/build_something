class ProjectMaterial < ActiveRecord::Base 
  belongs_to :project
  belongs_to :material



def self.material_id_count 
  self.group(:material_id).count
end 

def self.most_common_material_id
  material_id_count.first[0]
end 

end