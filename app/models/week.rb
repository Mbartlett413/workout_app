class Week < ApplicationRecord
	belongs_to :user
	has_many :week_collections
	has_many :workouts, foreign_key: :workout_id, class_name: "WeekCollection"
	has_many :weeks, foreign_key: :week_id, class_name: "WeekCollection", dependent: :destroy
end
