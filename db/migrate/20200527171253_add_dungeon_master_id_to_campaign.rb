class AddDungeonMasterIdToCampaign < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :dungeon_master_id, :integer
  end
end
