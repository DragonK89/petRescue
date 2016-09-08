class PetController < ApplicationController
	skip_before_action  :verify_authenticity_token
	before_action :check_role

	def show
		query = Pet
		if params[:health_status]
			query=query.where(health_status: params[:health_status])
		end
		if params[:foster_status]
			query=query.where.not(foster_status: params[:foster_status])
		end
		if !params[:health_status] && !params[:foster_status]
			query =query.all
		end
		render :json => query
	end

	def register_gui
		@clinic_list = Clinic.all
	end

	def register
		if !params[:file]
			return render :json => {status: 0,message:"Please put pet image!"}
		end
		if params[:clinic_id]
			pet = Pet.create(clinic_id:params[:clinic_id],pet_name: params[:pet_name],description: params[:description],foster_status:params[:foster_status].to_i,health_status: params[:health_status],address:params[:address],longitude:params[:longitude],latitude:params[:latitude])
		else
			pet = Pet.create(pet_name: params[:pet_name],description: params[:description],foster_status:params[:foster_status].to_i,health_status: params[:health_status],address:params[:address],longitude:params[:longitude],latitude:params[:latitude])
		end
		if !pet.valid?
			render :json => {status: 0,message:"Invalid field!"}
		else
			url = ApplicationHelper.write_compress_img(params[:file])
			pet.update(before_img_url: url)
			render :json => {status: 1,message:"Register pet success!"}
		end
	end

	def register_clinic
		if @user_id
			pet = Pet.find(parmas[:pet_id])
			clinic = Clinic.find(parmas[:clinic_id])
			pet.update(clinic_id:clinic.id)
			render :json => {status: 1,message:"Register pet id "+pet.id+" to clinic id "+clinic.id+" success"}
		else
			render :json => {status: 0,message:"Please login first!"}
		end
	end
	
	def pending_user
		if !@user_id
			return render :json => {status:0,message:"Please login first!"}
		end
		pet = Pet.find(params[:pet_id])
		if !pet
			return render :json => {status: 0,message:"Can't find this pet!"}
		end
		key = ApplicationHelper.generate_code(5)
		payload = {:user_id => @user_id, :pet_id => params[:pet_id] }
		confirm_code= JWT.encode payload, key , 'HS256'
		pet.update(confirm_code: confirm_code,health_status: 1)
		render :json => {status: 1,message:"Do not lost this key , key only valid till 12:00 AM",confirm_code: pet.id.to_s+"-"+key}
	end

	def register_user_gui
	end
	def register_user
		keys = params[:key].split('-')
		pet = Pet.find(keys[0])
		if !pet
			return render :json => {status:0,message:"Can't find this pet!"}
		end
		confirm_code = JWT.decode pet[:confirm_code] , keys[1] , true , { :algorithm => 'HS256' }
		if confirm_code[0]["user_id"]
			user = User.find(confirm_code[0]["user_id" ])
			if !user
				return render :json => {status:0,message:"Can't find user!"}
			end
		end
		pet.update(user_id:user.id,confirm_code: nil,health_status: 2)
		render :json => {status: 1,message:"Register pet id "+pet.id.to_s+" to user id "+user.id.to_s+" success!"}
	end

	def change_status
		if @user_id
			pet = Pet.find(parmas[:pet_id])
			if params[:foster_status]
				# pet.update(foster_status:params[:foster_status].to_i)
			end
			if params[:health_status]
				pet.update(health_status: 1)
			end
			render :json => {status: 1,message:"Updated pet success!"}
		else
			render :json => {status: 0,message:"Please login first!"}
		end
	end
end