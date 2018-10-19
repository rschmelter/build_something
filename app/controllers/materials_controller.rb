class MaterialsController < ApplicationController 


def show 
    @material = material.find(params[:id])
end

def index 
    @materials = Material.all
end 


end