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

    def find_hours
        @start = params[:session][:start_time].to_time
        @end = params[:session][:end_time].to_time
        @hours = ((@end - @start).to_f/3600).to_f
    end

end
