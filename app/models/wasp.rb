class Wasp < ApplicationRecord
	belongs_to :workout
	has_many :exercises
	has_many :set_reps

end
