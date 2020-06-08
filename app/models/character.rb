class Character < ApplicationRecord
    belongs_to :player,
    :class_name => "User",
    :foreign_key => :user_id

    def status
        if current_hit_points < 1 
            "critical"
        elsif current_hit_points <= (max_hit_points * 0.5)
            "bloodied"
        else  
            "alive"
        end
    end

    def damageable 
        self.damage = 0 
        self.current_hit_points = self.max_hit_points
    end

    def take_damage(damage)
        self.damage += damage.to_i
        self.current_hit_points = self.max_hit_points - self.damage 
    end
end
