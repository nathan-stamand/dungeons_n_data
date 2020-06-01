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
        @session = Session.new(session_params)
        @session.find_hours(params)
        binding.pry
    end

    def edit
    end

    def update
    end

    def show
    end

    def destroy
    end

    private

    def session_params 
        params.require(:session).permit(:start_time, :end_time, :place, :date, :campaign_id)
    end 

end
