class Profile < ApplicationRecord
	belongs_to :user
	has_many :max_efforts
end
