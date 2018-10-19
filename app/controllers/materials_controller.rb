class MaterialsController < ApplicationController 


    def show 
        @material = Material.find(params[:id])
    end

    def index 
        @materials = Material.all
    end 

    def recommendations
        @material = Material.find(params[:id])
        @recommendations = @material.recommendations 
        render json: @recommendations
    end


end