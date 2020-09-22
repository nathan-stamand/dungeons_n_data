class AddStatsToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :alignment, :text
    add_column :characters, :max_hit_points, :integer
    add_column :characters, :current_hit_points, :integer
    add_column :characters, :damage, :integer
  end
end
