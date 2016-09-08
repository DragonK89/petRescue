class ClinicController < ApplicationController
	skip_before_action  :verify_authenticity_token
	before_action :check_role

	def register
			Clinic.create()
			if !pet.valid?
				render :json => {status: 0,message:"Invalid field!"}
			else
				render :json => {status: 1,message:"Register clinic success!"}
			end
	end

	def show
		render :json => Clinic.all
	end
	
	def seed
		data = [
    {
      "clinic_id": 1,
      "clinic_name": "Phòng khám Thú y Hà Nội",
      "address": "2 Hoàng Hoa Thám",
      "longitude": "21.037303",
      "latitude": "105.822188",
      "pet_id": ""
     },
     {
      "clinic_id": 2,
      "clinic_name": "Animal Care",
      "address": "424 Thuỵ Khuê",
      "longitude": "21.047121",
      "latitude": "105.811509",
      "pet_id": ""
     },
     {
      "clinic_id": 3,
      "clinic_name": "Hải Đăng PetCare",
      "address": "71 Trần Nhân Tông",
      "longitude": "21.017744",
      "latitude": "105.841713",
      "pet_id": ""
     },
     {
      "clinic_id": 4,
      "clinic_name": "Pet Health",
      "address": "240 Âu Cơ",
      "longitude": "21.070400",
      "latitude": "105.826213",
      "pet_id": ""
     },
     {
      "clinic_id": 5,
      "clinic_name": "Phòng khám Thú y BS Hoàng Ngọc Báu",
      "address": "50 Ngọc lâm",
      "longitude": "21.043934",
      "latitude": "105.867224",
      "pet_id": ""
     },
     {
      "clinic_id": 6,
      "clinic_name": "Phòng khám Thú y 4Pet",
      "address": "506/31 Bạch Mai",
      "longitude": "20.997012",
      "latitude": "105.850116",
      "pet_id": ""
     },
     {
      "clinic_id": 7,
      "clinic_name": "Cục Thú y Hà Nội",
      "address": "143 Hồ Đắc Di",
      "longitude": "21.013129",
      "latitude": "105.827532",
      "pet_id": ""
     },
     {
      "clinic_id": 8,
      "clinic_name": "Hải Đăng Petcare",
      "address": "304 lê Duẩn",
      "longitude": "21.014588",
      "latitude": "105.841437",
      "pet_id": ""
     },
     {
      "clinic_id": 9,
      "clinic_name": "Hanvet",
      "address": "126 Trung Kính",
      "longitude": "21.017055",
      "latitude": "105.793898",
      "pet_id": ""
     },
     {
      "clinic_id": 10,
      "clinic_name": "Bệnh Xá Thú y - Viện Thú y Quốc Gia",
      "address": "74 Trường Chinh",
      "longitude": "21.002822",
      "latitude": "105.826869",
      "pet_id": ""
     },
     {
      "clinic_id": 11,
      "clinic_name": "Bảo Sinh",
      "address": "167/30 Trương Định",
      "longitude": "20.990966",
      "latitude": "105.848345",
      "pet_id": ""
     }
]
	data.each do |i|
		Clinic.create(clinic_name: i[:clinic_name],address:i[:address],longitude:i[:longitude],latitude:i[:latitude])
	end
	render :json => Clinic.all
	end

end