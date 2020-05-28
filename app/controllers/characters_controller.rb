class CharactersController < ApplicationController
    def new
        @character = Character.new
    end

    def create 
        @character = Character.new(character_params)
        
    end

    private 

    def character_params 
        params.require(:character).permit(:name, :level, :class, :race)
    end
end
