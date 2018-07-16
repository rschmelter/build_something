class MaterialsController < ApplicationController 


def index 
  tools = Material.tool
  raw_materials = Material.raw_material
end 


end