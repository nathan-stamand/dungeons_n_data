class ChangeSessionsToDndSessions < ActiveRecord::Migration[6.0]
  def change
    rename_table :sessions, :dnd_sessions
  end
end
