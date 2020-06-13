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

  def damage_limiter
    case
    when self.current_hit_points > self.max_hit_points
      self.current_hit_points = self.max_hit_points
      self.damage = 0
    when self.current_hit_points < (self.max_hit_points * -1)
      self.current_hit_points = (self.max_hit_points * -1)
      self.damage = self.max_hit_points * 2
    end
    self.save
  end

  def take_damage(damage)
    if !self.damage
      self.damageable
    else 
      self.damage += damage.to_i
    end
    self.current_hit_points = self.max_hit_points - self.damage
    self.damage_limiter
    self.save
  end

  def assign_campaign(params)
    @old_campaign = Campaign.find_by(id: params[:character][:old_campaign_id])
    @new_campaign = Campaign.find_by(id: params[:character][:campaign_id])
    self.campaign = @new_campaign
    @old_campaign.save if @old_campaign 
    @new_campaign.save if @new_campaign
    self.save
  end

  def update_damage_and_campaign(params)
    if params[:character]
      damage = params[:character][:damage]
      campaign = params[:character][:campaign_id]
      assign_campaign(params) if campaign
      take_damage(params[:character][:damage]) if damage
    end
  end
end
