class CreateSetReps < ActiveRecord::Migration[5.2]
  def change
    create_table :set_reps do |t|
      t.string :title

      t.timestamps
    end
  end
end
