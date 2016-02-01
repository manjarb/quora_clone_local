class UpdateTagQuestion < ActiveRecord::Migration
	def change
		tag_type_arr = ['food','sport','thai'] 
		Question.find_each do |question|
	      question.tag = tag_type_arr[rand(0..2)]
	      question.save!
	    end
	end
end
