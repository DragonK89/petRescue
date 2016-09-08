class UserController < ApplicationController
	skip_before_action  :verify_authenticity_token
	before_action :check_role

	def login
		user = User.find_by_user_name(params[:user_name])
		if user
			if user.password == params[:password]
				payload = {:user_id => user.id,:expires => 24.hours.from_now }
				cookies[:token] = JWT.encode payload, '$ecretK3y' , 'HS256'
				render :json => {status: 1,message:"Logged in success!",}
			else
				render :json => {status: 0,message:"Wrong info!"}
			end
		else
			render :json => {status: 0,message:"User not exist!"}
		end
	end

	def register
		puts User.column_names
		user = User.create(user_name: params[:user_name],display_name:params[:display_name],password: params[:password],phone_number:params[:phone_number],address:params[:address],longitude:params[:longitude],latitude:params[:latitude])
		if(!user.valid?)
			render :json => {status: 0,message:"Invalid field!"}
		else
			render :json => {status: 1,message:"Register user success!"}
		end
	end

	def profile
		if @user_id
			user = User.find(@user_id)
			render :json  => user
		end
	end

	def edit
		if @role == 'guest'
			redirect_to '/user/login'
		else
			if request.post?
				user = User.find(@user_id)
				if params[:name]
					user.update(name: params[:name])
				end
				if params[:file]
					path=Rails.root.to_s+"/public/user_img/"+@user_id.to_s
					ApplicationHelper.write_compress_img(path,params[:file].read)
					user.update(img_url: "/user_img/"+@user_id.to_s)
				end
				redirect_to '/user/profile'
			else
				render layout:'dash_board'
			end
		end
	end

	def logout
		cookies.delete :token
		render :json => {status: 0, message:"Logout in success!",}
	end

end