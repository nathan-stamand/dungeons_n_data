class AddEndTimeToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :end_time, :datetime
  end
end
