class CharactersController < ApplicationController
    
    def index
        @user = User.find_by(id: params[:user_id])
        @characters = @user.characters
    end
    
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

    def show
        @character = Character.find_by(id: params[:id])
        @user = current_user
        @creator = @character.player
    end

    def edit
        @character = Character.find_by(id: params[:id])
        @user = current_user
    end

    def update
        @user = current_user
        @character = Character.find_by(id: params[:id])
        @character.update(character_params)
        if @character.save 
            redirect_to character_path(@character)
        else 
            render edit_character_path(@character)
        end

    end

    def destroy 
        @character = Character.find_by(id: params[:id])
        @character.destroy
        redirect_to user_characters_path(current_user)
    end
    private 

    def character_params 
        params.require(:character).permit(:name, :level, :character_class, :race)
    end
end
