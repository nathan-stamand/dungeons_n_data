class SessionsController < ApplicationController

    def index
        @campaign = Campaign.find_by(id: params[:campaign_id])
        @sessions = @campaign.sessions
    end

    def new
        @campaign = Campaign.find_by(id: params[:campaign_id])
        @session = Session.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def show
    end

    def destroy
    end

end
