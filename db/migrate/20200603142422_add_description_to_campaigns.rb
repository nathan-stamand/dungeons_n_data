class AddDescriptionToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :description, :text
  end
end
