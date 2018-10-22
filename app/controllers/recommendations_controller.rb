class RecommendationsController < ApplicationController

    def create 
        
       @material = Material.find(params[:material_id])
        @recommendation = @material.recommendations.build(recommendations_params)
            if @recommendation.save
                
                redirect_to @material
            else
                render "materials/show"
            end
        
    end


private

    def recommendations_params
        params.require(:recommendation).permit(:name, :cost, :buy)
    end

end