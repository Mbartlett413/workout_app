class Workout < ApplicationRecord
	belongs_to :user
	has_many :wasps
	has_many :workouts, foreign_key: :workout_id, class_name: "Wasp", dependent: :destroy
	#has_many :exercises, foreign_key: :exercise_id, class_name: "Wasp"
	#has_many :set_reps, foreign_key: :setRep_id, class_name: "SetRepCombo"
end
