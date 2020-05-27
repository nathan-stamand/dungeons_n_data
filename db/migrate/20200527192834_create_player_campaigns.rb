class CreatePlayerCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :player_campaigns do |t|
      t.integer :user_id
      t.integer :campaign_id
    end
  end
end
