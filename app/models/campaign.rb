class Campaign < ApplicationRecord
    has_many :sessions
    belongs_to :dungeon_master, 
      :class_name => "User",
      :foreign_key => :user_id
    has_many :player_campaigns
    has_many :players, through: :player_campaigns
    has_many :characters, through: :players
end
