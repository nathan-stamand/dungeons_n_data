class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.text :name
      t.integer :level
      t.text :class
      t.text :race

      t.timestamps
    end
  end
end
