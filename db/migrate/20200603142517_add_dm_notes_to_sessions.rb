class AddDmNotesToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :dm_notes, :string
  end
end
