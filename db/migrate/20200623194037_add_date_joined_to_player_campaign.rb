class AddDateJoinedToPlayerCampaign < ActiveRecord::Migration[6.0]
  def change
    add_column :player_campaigns, :date_joined, :datetime
  end
end
