class MaterialsController < ApplicationController 


    def show 
        @material = Material.find(params[:id])
    end

    def index 
        @materials = Material.all
    end 




end