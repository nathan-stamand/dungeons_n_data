class RenameCharactersPlayerIdToUserId < ActiveRecord::Migration[6.0]
  def change
    rename_column :characters, :player_id, :user_id
  end
end
