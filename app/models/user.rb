class User < ApplicationRecord
  has_many :created_campaigns,
           :class_name => "Campaign",
           dependent: :destroy
  has_many :dnd_sessions, through: :created_campaigns
  has_many :player_campaigns
  has_many :play_campaigns, through: :player_campaigns
  has_many :characters, dependent: :destroy
  validates :email, presence: :true
  validates :username, presence: :true
  has_secure_password

  def friends 
    friends = []
    if self.play_campaigns
      self.play_campaigns.each do |campaign| 
        friends << campaign.dungeon_master
        friends << campaign.players 
      end 
    end
    if self.created_campaigns 
      self.created_campaigns.each do |campaign|
        friends << campaign.players
      end
    end
    friends = friends.flatten.uniq - [self]
  end
end
