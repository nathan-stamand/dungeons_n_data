class Campaign < ApplicationRecord
    has_many :dnd_sessions
    belongs_to :dungeon_master,
               :class_name => "User",
               :foreign_key => :user_id
    has_many :player_campaigns
    has_many :players, through: :player_campaigns
    has_many :characters
    validates :title, presence: true

  def add_player(params)
    if params[:campaign][:players]
        @player = User.find_by(id: params[:campaign][:players])
        @join = PlayerCampaign.create(user_id: @player.id, campaign_id: self.id)
    end
  end

  def recent_sessions
    @sessions = self.dnd_sessions.sort{|sesh_1, sesh_2| sesh_1.date.to_time <=> sesh_2.date.to_time}
    if self.dnd_sessions.length > 3
      [@sessions[-1], @sessions[-2], @sessions[-3]]
    else
      @sessions.reverse
    end
  end
end
