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
        
    end
end
