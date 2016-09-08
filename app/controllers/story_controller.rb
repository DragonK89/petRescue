class StoryController < ApplicationController
	skip_before_action  :verify_authenticity_token
	before_action :check_role

	def create
		pet = Pet.find(params[:pet_id])
		if !pet
			return render :json => {status:0,message:"pet not found"}
		end
		story = pet.stories.create(story: params[:story])
		if !story.valid?
			return render :json => {status:0,message:"invalid field"}
		end
		render :json => {status:1,message:"add story success"}
	end

	def show
		pet = Pet.find(params[:pet_id])
		if !pet
			return render :json => {status:0,message:"pet not found"}
		end
		render :json => pet.stories.all
	end

	def create_gui
	end
end