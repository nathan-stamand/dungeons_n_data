class Character < ApplicationRecord
    belongs_to :player,
    :class_name => "User",
    :foreign_key => :player_id
end
