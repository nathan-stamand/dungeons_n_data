class Campaign < ApplicationRecord
    has_many :dnd_sessions, dependent: :destroy
    belongs_to :dungeon_master,
               :class_name => "User",
               :foreign_key => :user_id
    has_many :player_campaigns, dependent: :destroy
    has_many :players, through: :player_campaigns
    has_many :characters
    validates :title, presence: true

  def add_player(params)
    if params[:campaign][:players] != ""
        @player = User.find_by(username: params[:campaign][:players])
        @join = PlayerCampaign.create(user_id: @player.id, campaign_id: self.id) if @player
    end
  end

  def save_and_add_players(params)
    self.save && self.add_player(params)
  end

  def set_sessions(params)
    time_filter = params[:dnd_session]
    notes = params[:dm_notes].to_i
    sessions = self.dnd_sessions
    case
    when time_filter == "Created Last 30 Days" 
      notes > 0 ? sessions.recently_made.with_notes : sessions.recently_made
    when time_filter == "Updated Last 30 Days"
      notes > 0 ? sessions.recently_changed.with_notes : sessions.recently_changed
    when time_filter == ""
      notes > 0 ? sessions.with_notes : sessions
    end
  end

  def removals(params)
    case
    when params[:remove_character] 
      character = Character.find_by(id: params[:remove_character])
      self.characters.delete_by(id: character.id)
      self.save
    when params[:remove_player]
      player = User.find_by(id: params[:remove_player])
      self.players.delete(player)
      self.characters.delete_by(user_id: player.id)
      self.save
    end
  end
end
