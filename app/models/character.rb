class Character < ApplicationRecord
    belongs_to :player,
    :class_name => "User",
    :foreign_key => :user_id
    scope :alive, -> {where("current_hit_points > 0")}
    scope :bloodied, -> {alive.where("current_hit_points <= (max_hit_points * .5)")}
    scope :critical, -> {where("current_hit_points == 0")}
end
