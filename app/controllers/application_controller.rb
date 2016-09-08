class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def check_role
  	if cookies[:token]
  		key = JWT.decode cookies[:token] , '$ecretK3y' , true , { :algorithm => 'HS256' }
  		@user_id = key[0]["user_id"]
  	end
  end
end
