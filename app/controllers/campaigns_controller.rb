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
        @campaign = Campaign.new(campaign_params)
        @campaign.dungeon_master = current_user
        binding.pry
    end

    private 

    def campaign_params
        params.require(:campaign).permit(:title)
    end
end
