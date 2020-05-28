class CharactersController < ApplicationController
    def new
        @character = Character.new
    end

    def create 
        @character = Character.new(character_params)
        @character.player = current_user     
        if @character.save 
            redirect_to character_path(@character)
        else 
            render new_character_path
        end
    end

    private 

    def character_params 
        params.require(:character).permit(:name, :level, :character_class, :race)
    end
end
