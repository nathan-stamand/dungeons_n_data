class DndSessionsController < ApplicationController

  def index
    @campaign = Campaign.find_by(id: params[:campaign_id])
    @sessions = @campaign.set_sessions(params) || @campaign.dnd_sessions
  end

  def new
    @campaign = Campaign.find_by(id: params[:campaign_id])
    @creator = @campaign.dungeon_master
    @dnd_session = DndSession.new
  end

  def create
      @dnd_session = DndSession.new(dnd_session_params)
      @campaign = Campaign.find_by(id: params[:dnd_session][:campaign_id])
      @dnd_session.find_hours(params)
    if @dnd_session.save
      @campaign.dnd_sessions << @dnd_session
      @campaign.save
      redirect_to campaign_dnd_sessions_path(@campaign)
    else
      render new_campaign_dnd_session_path(@camaign)
    end
  end

  def edit
    @campaign = Campaign.find_by(id: params[:campaign_id])
    @dnd_session = DndSession.find_by(id: params[:id])
    @creator = @campaign.dungeon_master
  end

  def update
    @dnd_session = DndSession.find_by(id: params[:id])
    @campaign = @dnd_session.campaign
    @creator = @campaign.dungeon_master
    if @dnd_session.update(dnd_session_params)
      redirect_to campaign_dnd_session_path(@campaign, @dnd_session)
    else  
      render edit_dnd_session_path(@dnd_session)
    end
  end

  def show
    @campaign = Campaign.find_by(id: params[:campaign_id])
    @dnd_session = DndSession.find_by(id: params[:id])
    @creator = @campaign.dungeon_master
  end

  def destroy
  end

  private

  def dnd_session_params
    params.require(:dnd_session).permit(:start_time, :end_time, :place, :date, :campaign_id, :dm_notes)
  end
end
