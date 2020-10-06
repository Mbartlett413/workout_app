class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :title
      t.boolean :primary_exercise
      t.boolean :accesory_exercise

      t.timestamps
    end
  end
end
