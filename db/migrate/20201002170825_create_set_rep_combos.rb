class CreateSetRepCombos < ActiveRecord::Migration[5.2]
  def change
    create_table :set_rep_combos do |t|
		t.belongs_to :set_rep, foreign_key: true
		t.integer :percent
		t.integer :reps
	    
      t.timestamps
    end
  end
end
