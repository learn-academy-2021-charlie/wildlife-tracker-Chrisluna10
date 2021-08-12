class SightingsController < ApplicationController
    
    def index
        sighting = Sighting.all
        render json: sighting
    end
    
    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    def destroy
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            @id = params[:id]
            render json: "Sighting #{@id} destroyed"
        else 
            render json: sighting.errors
        end
    end

    private
    def sighting_params
        params.require(:sighting).permit(:animal_id, :latitude, :longitude)
    end
end
