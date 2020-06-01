class ChangeSessionStartTimeAndEndTimeTypesToString < ActiveRecord::Migration[6.0]
  def change
    change_column :sessions, :start_time, :string 
    change_column :sessions, :end_time, :string
  end
end
