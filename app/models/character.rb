class Character < ApplicationRecord
    belongs_to :player,
    :class_name => "User",
    :foreign_key => :user_id
    scope :alive, -> {where("current_hit_points > 0")}
    scope :bloodied, -> {alive.where("current_hit_points <= (max_hit_points * .5)")}
    scope :critical, -> {where("current_hit_points == 0")}

    def status
        if current_hit_points < 1 
            "critical"
        elsif current_hit_points <= (max_hit_points * 0.5)
            "bloodied"
        else  
            "alive"
        end
    end
end
