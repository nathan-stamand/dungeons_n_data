class CampaignsController < ApplicationController

    def index
        @user = User.find_by(id: params[:user_id])
        @play_campaigns = @user.play_campaigns
        @created_campaigns = @user.created_campaigns
    end

    def new
        @campaign = Campaign.new
    end

    def create 
        @user = current_user
        @campaign = @user.created_campaigns.build(campaign_params)
        if @campaign.save
            redirect_to user_campaign_path(@user, @campaign)
        else
            render new_campaign_path
        end
    end

    def show
        @campaign = Campaign.find_by(id: params[:id])
        @dungeon_master = @campaign.dungeon_master
        @user = current_user
    end

    private 

    def campaign_params
        params.require(:campaign).permit(:title)
    end
end
