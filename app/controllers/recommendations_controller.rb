class RecommendationsController < ApplicationController

    def create 
        
       @material = Material.find(params[:material_id])
        @recommendation = @material.recommendations.build(recommendations_params)
        
            if @recommendation.save
                
                render json: @recommendation
            else
                render "materials/show"
            end
        
    end

    def show 
        @recommendation = Recommendation.find(params[:id])
        render json: @recommendation

    end


private

    def recommendations_params
        params.require(:recommendation).permit(:name, :cost, :buy)
    end

end