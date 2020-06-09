class CharactersController < ApplicationController
    
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
    @character = Character.find_by(id: params[:id])
    @creator = @character.player
    if params[:character]
      @character.take_damage(params[:character][:damage])
      @old_campaign = Campaign.find_by(id: params[:character][:old_campaign_id])
      @campaign = Campaign.find_by(id: params[:character][:campaign_id])
      @character.campaign = @campaign
      @old_campaign.save if @old_campaign
      @campaign.save if @campaign
      @character.save
    end
  end

  def edit
    @character = Character.find_by(id: params[:id])
    @creator = @character.player
  end

  def update
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
    @creator = @character.player
    @character.destroy if check
    redirect_to user_characters_path(@creator)
  end

  private

  def character_params
    params.require(:character).permit(:name, :level, :character_class,
                                      :race, :max_hit_points, :alignment,
                                      :campaign_id)
  end
end
