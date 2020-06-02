class Campaign < ApplicationRecord
    has_many :sessions
    belongs_to :dungeon_master, 
      :class_name => "User",
      :foreign_key => :user_id
    has_many :player_campaigns
    has_many :players, through: :player_campaigns
    has_many :characters, through: :players
    validates :title, presence: true

  def add_player(params)
    if params[:campaign][:players]
        @player = User.find_by(id: params[:campaign][:players])
        @join = PlayerCampaign.create(user_id: @player.id, campaign_id: self.id)
    end
  end

end
