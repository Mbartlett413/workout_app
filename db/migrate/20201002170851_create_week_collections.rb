class CreateWeekCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :week_collections do |t|
		t.integer :week_id, foreign_key: true
		t.integer :workout_id, foreign_key: true
		t.belongs_to :week, foreign_key: true

      t.timestamps
    end
  end
end
