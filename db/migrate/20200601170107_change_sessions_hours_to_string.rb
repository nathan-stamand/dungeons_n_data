class ChangeSessionsHoursToString < ActiveRecord::Migration[6.0]
  def change
    change_column :sessions, :hours, :text 
  end
end
