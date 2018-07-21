class ProjectMaterialsController < ApplicationController


  def most_common
    id = ProjectMaterial.material_id_count.first[0]
    @material = Material.find(id)
  end 



end 