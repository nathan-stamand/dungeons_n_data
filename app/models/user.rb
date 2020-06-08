class User < ApplicationRecord
  has_many :created_campaigns,
           :class_name => "Campaign"
  has_many :dnd_sessions, through: :created_campaigns
  has_many :player_campaigns
  has_many :play_campaigns, through: :player_campaigns
  has_many :characters
  has_secure_password
end
