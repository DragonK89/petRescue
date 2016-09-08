class User < ApplicationRecord
	has_many :pets
	validates :user_name , :password ,:display_name ,:phone_number ,:address, presence: true
	validates :user_name , uniqueness: true
end
