class ProjectMaterialsController < ApplicationController


  def most_common
    id = ProjectMaterial.sort_material_ids.last[0]
    @material = Material.find(id)
    @tools = ProjectMaterial.tools
    @raw_materials = ProjectMaterial.raw_materials
  end 



end