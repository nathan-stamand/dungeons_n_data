class User < ApplicationRecord
  has_many :created_campaigns,
           :class_name => "Campaign",
           dependent: :destroy
  has_many :dnd_sessions, through: :created_campaigns
  has_many :player_campaigns
  has_many :play_campaigns, through: :player_campaigns
  has_many :characters, dependent: :destroy
  validates :email, presence: :true, uniqueness: true
  validates :username, presence: :true, uniqueness: true
  has_secure_password

  def clean_list(array)
    clean_list = []
    array.each do |campaign|
      clean_list << campaign.dungeon_master
      clean_list << campaign.players
    end
    clean_list.flatten.uniq - [self]
  end

  def friends 
    friends = []
    if play_campaigns
      friends << clean_list(play_campaigns)
    end
    if created_campaigns 
      friends << clean_list(created_campaigns)
    end
    friends = friends.flatten.uniq - [self]
  end
end
