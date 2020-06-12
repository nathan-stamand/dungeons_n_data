class Character < ApplicationRecord
  belongs_to :player,
             :class_name => "User",
             :foreign_key => :user_id
  belongs_to :campaign, required: false
  validates :name, presence: :true
  validates :level, presence: :true, numericality: {only_integer: true}
  validates :max_hit_points, presence: :true, numericality: {only_integer: true}

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
    case
    when self.current_hit_points > self.max_hit_points
      self.current_hit_points = self.max_hit_points
      self.damage = 0
    when self.current_hit_points < (self.max_hit_points * -1)
      self.current_hit_points = (self.max_hit_points * -1)
      self.damage = self.max_hit_points * 2
    end
  end
end
