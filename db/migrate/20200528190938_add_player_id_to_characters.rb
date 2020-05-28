class AddPlayerIdToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :player_id, :integer
  end
end
