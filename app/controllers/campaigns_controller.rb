class CampaignsController < ApplicationController

    def index
        @user = current_user
        @creator = User.find_by(id: params[:user_id])
        @play_campaigns = @creator.play_campaigns
        @created_campaigns = @creator.created_campaigns
    end

    def new
        @campaign = Campaign.new
    end

    def create 
        @user = current_user
        @campaign = @user.created_campaigns.build(campaign_params)
        if @campaign.save
            @campaign.add_player(params)
            redirect_to user_campaign_path(@user, @campaign)
        else
            render new_campaign_path
        end
    end

    def show
        @campaign = Campaign.find_by(id: params[:id])
        @creator = @campaign.dungeon_master
        @user = current_user
        @recent_sessions = @campaign.recent_sessions
    end

    def edit
        @campaign = Campaign.find_by(id: params[:id])
        @creator = @campaign.dungeon_master
        @user = current_user
    end

    def update
        @campaign = Campaign.find_by(id: params[:id])
        @creator = @campaign.dungeon_master
        @campaign.update(campaign_params)
        if @campaign.save
            redirect_to user_campaign_path(@creator, @campaign)
        else
            render "edit"
        end
    end

    private 

    def campaign_params
        params.require(:campaign).permit(:title)
    end
end
