class RenameSessionsTimeToStartTime < ActiveRecord::Migration[6.0]
  def change
    rename_column :sessions, :time, :start_time
  end
end
