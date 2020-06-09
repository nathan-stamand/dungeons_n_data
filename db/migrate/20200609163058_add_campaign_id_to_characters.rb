class AddCampaignIdToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :campaign_id, :integer
  end
end
