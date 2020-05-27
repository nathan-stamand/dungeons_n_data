class CreatePlayerCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :player_campaigns do |t|
      t.integer :player_id
      t.integer :play_campaign_id
    end
  end
end
