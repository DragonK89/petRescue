class Pet < ApplicationRecord
	validates :description , :health_status , :foster_status , presence: true
	has_many :stories
end
