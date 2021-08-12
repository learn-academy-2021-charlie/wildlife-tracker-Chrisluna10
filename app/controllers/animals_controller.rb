class AnimalsController < ApplicationController

    def index
        animal = Animal.all
        render json: animal
    end

    def show
        animal = Animal.find(params[:id])
        render json: animal, include: :sightings
    end
    
    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else 
            render json: animal.errors
        end
    end

    def edit
        animal = Animal.find(params[:id])
    end

    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json:animal
        else 
            render json: animal.errors
        end
    end

    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            @id = params[:id]
            render json: "Animal #{@id} deleted"
        else
            render json: animal.errors
        end
    end
    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
end
