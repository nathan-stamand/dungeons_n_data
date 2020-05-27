class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :place
      t.datetime :time
      t.integer :hours
      t.integer :campaign_id

      t.timestamps
    end
  end
end
