class CharactersController < ApplicationController
  before_action :assign_variables, except: [:index, :new, :create]
    
  def index
    @creator = User.find_by(id: params[:user_id])
    @characters = @creator.characters
  end
    
  def new
    @character = Character.new
    @creator = User.find_by(id: params[:user_id])
  end

  def create
    @character = Character.new(character_params)
    @character.player = current_user
    @creator = @character.player
    @character.damageable
    if @character.save
      redirect_to character_path(@character)
    else
      render new_character_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @character.update(character_params)
    if @character.save
      @character.update_damage_and_campaign(params)
      redirect_to character_path(@character)
    else
      render edit_character_path(@character)
    end
  end

  def destroy
    @character.destroy if check
    redirect_to user_characters_path(@creator)
  end

  private

  def character_params
    params.require(:character).permit(:name, :level, :character_class,
                                      :race, :max_hit_points, :alignment,
                                      :campaign_id)
  end

  def assign_variables
    @character = Character.find_by(id: params[:id])
    @creator = @character.player if @character
  end
end
