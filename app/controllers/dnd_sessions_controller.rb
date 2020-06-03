class DndSessionsController < ApplicationController

    def index
        @campaign = Campaign.find_by(id: params[:campaign_id])
        @sessions = @campaign.dnd_sessions
    end

    def new
        @campaign = Campaign.find_by(id: params[:campaign_id])
        @session = Session.new
    end

    def create
        @session = DndSession.new(dnd_session_params)
        @campaign = Campaign.find_by(id: params[:session][:campaign_id])
        @session.find_hours(params)
        if @session.save
            @campaign.dnd_sessions << @session 
            @campaign.save
            redirect_to campaign_dnd_sessions_path(@campaign)
        else
            render new_campaign_dnd_session_path(@camaign)
        end
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

    def dnd_session_params 
        params.require(:dnd_session).permit(:start_time, :end_time, :place, :date, :campaign_id)
    end 

end
