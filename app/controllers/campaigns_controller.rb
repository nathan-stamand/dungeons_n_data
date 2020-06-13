class CampaignsController < ApplicationController
  before_action :assign_variables, except: [:index]
  before_action :delete_doubles

  def index
    @creator = User.find_by(id: params[:user_id])
    @play_campaigns = @creator.play_campaigns
    @created_campaigns = @creator.created_campaigns
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = @user.created_campaigns.build(campaign_params)
    if @campaign.save_and_add_players(params)
      redirect_to user_campaign_path(@user, @campaign)
    else
      render new_campaign_path
    end
  end

  def show
    @recent_sessions = @campaign.dnd_sessions.recently_made
    @campaign.removals(params)
  end

  def edit
  end

  def update
    @campaign.update(campaign_params)
    @campaign.add_player(params)
    if @campaign.save
      redirect_to user_campaign_path(@creator, @campaign)
    else
      render "edit"
    end
  end

  def destroy
    @campaign = Campaign.find_by(id: params[:id])
    @campaign.destroy if current_user == @campaign.dungeon_master
    redirect_to user_campaigns_path(current_user)
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title)
  end

  def assign_variables
    @campaign = Campaign.find_by(id: params[:id])
    @creator = @campaign ? @campaign.dungeon_master : User.find_by(id: params[:user_id])
  end

  def delete_doubles
    if @campaign
      @campaign.players = @campaign.players.uniq
    end
  end
end
