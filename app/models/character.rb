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
    damage = 0
    current_hit_points = max_hit_points
  end

  def damage_limiter
    case
    when current_hit_points > max_hit_points
      current_hit_points = max_hit_points
      damage = 0
    when current_hit_points < (max_hit_points * -1)
      current_hit_points = (max_hit_points * -1)
      damage = max_hit_points * 2
    end
  end

  def take_damage(damage)
    damage += damage.to_i
    current_hit_points = max_hit_points - damage
    damage_limiter
  end

  def assign_campaign(params)
    @old_campaign = Campaign.find_by(id: params[:character][:old_campaign_id])
    @new_campaign = Campaign.find_by(id: params[:character][:campaign_id])
    campaign = @new_campaign
    @old_campaign.save if @old_campaign 
    @new_campaign.save if @new_campaign
  end

  def update_damage_and_campaign(params)
    if params[:character]
      damage = params[:character][:damage]
      campaign = params[:character][:campaign_id]
      assign_campaign(params) if campaign
      take_damage(params[:character][:damage]) if damage
      self.save
    end
  end
end
