class SetRep < ApplicationRecord
	has_many :workouts
	has_many :set_rep_combos, foreign_key: :set_rep_id, class_name: "SetRepCombo"
end
