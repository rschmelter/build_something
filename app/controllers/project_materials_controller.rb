class ProjectMaterialsController < ApplicationController


  def materials
    id = ProjectMaterial.sort_material_ids.last[0]
    @material = Material.find(id)
    @tools = ProjectMaterial.tools
    @raw_materials = ProjectMaterial.raw_materials
  end 



end