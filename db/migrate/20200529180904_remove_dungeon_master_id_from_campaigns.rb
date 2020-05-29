class RemoveDungeonMasterIdFromCampaigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :dungeon_master_id
  end
end
