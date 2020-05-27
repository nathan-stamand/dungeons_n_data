class PlayerCampaign < ApplicationRecord
    belongs_to :player,
       :class_name => "User",
       :foreign_key => :user_id
    belongs_to :play_campaign,
       :class_name => "Campaign",
       :foreign_key => :campaign_id
end