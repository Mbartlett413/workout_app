class CreateWasps < ActiveRecord::Migration[5.2]
  def change
    create_table :wasps do |t|
		t.integer :workout_id, foreign_key: true
    	t.integer :exercise_id, foreign_key: true
		t.integer :set_rep_id, foreign_key: true
	    t.belongs_to :workout, foreign_key: true
      t.timestamps
    end
  end
end
