class Campaign < ApplicationRecord
    has_many :sessions
    belongs_to :dungeon_master, 
      :class_name => "User",
      :foreign_key => :dungeon_master_id
    has_many :players, 
      :class_name => "User"
    has_many :characters, through: :players
end
