class ProjectMaterialsController < ApplicationController


  def most_common
    id = ProjectMaterial.most_common_material_id
    @material = Material.find(id)
  end 



end