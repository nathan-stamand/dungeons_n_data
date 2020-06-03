class AddDescriptionToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :description, :string
  end
end
