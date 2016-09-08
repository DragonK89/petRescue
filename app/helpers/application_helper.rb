module ApplicationHelper
	Tinify.key = "T2NWScVS2DfUTnYBrJZRRlJDvqga7Dmp"

	def ApplicationHelper.write_compress_img(data)
		#puts "compressing img"
		#result_data = Tinify.from_buffer(data).to_buffer
		result = Cloudinary::Uploader.upload(data)
		result["url"]
	end

	def ApplicationHelper.generate_code(number)
		charset = Array('A'..'Z') + Array(0..9)
		Array.new(number) { charset.sample }.join
	end

end
