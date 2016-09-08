class StoryController < ApplicationController
	skip_before_action  :verify_authenticity_token
	before_action :check_role

	def create
		pet = Pet.find(params[:pet_id])
		if !pet
			return render :json => {status:0,message:"Pet not found!"}
		end
		story = pet.stories.new(story_params)
		story.update(view_numb: 0)
		if !story.valid?
			return render :json => {status:0,message:"Invalid field!"}
		end
		render :json => {status:1,message:"Add story success!"}
	end

	def show
		render :json => Story.all
	end

	def create_gui
  end

  def viewed
    story = Story.find(view_story_params)
    if !story
      render :json => {status:0,message:"Story not found!"}
    else
      view_numb = story.view_numb
      view_numb +=1
      story.update(view_numb: view_numb)
	  render :json => story
    end
  end
  
  def story_params
      params.require(:user).permit(:pet_id, :title, :story)
  end
  
  def view_story_params
      params.require(:user).permit(:story_id)
  end
  
end