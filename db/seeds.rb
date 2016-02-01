# require_relative '../app/models/question'
# require_relative '../app/models/answer'
# require_relative '../app/models/user'
# require 'faker'

class TaskSeed
	def self.faker
		20.times do 
			Question.create(
				:content => Faker::Lorem.sentence(200, true), 
				:headline => Faker::Lorem.sentence,
				:user_id => Faker::Number.between(1, 10)
				) 
		end

		40.times do 
			Answer.create(
				:content => Faker::Lorem.sentence(20, true), 
				:headline => Faker::Lorem.sentence,
				:user_id => Faker::Number.between(1, 10),
				:question_id => Faker::Number.between(1, 10)
				) 
		end

		20.times do
			User.create(
				:username => Faker::Internet.user_name, 
				:email => Faker::Internet.email,
				:encrypted_password => Faker::Internet.password(10, 20)
				) 
		end

		vote_type_arr = ['up','down'] 

		50.times do
			QuestionVote.create(
				:type => vote_type_arr[rand(0..1)],
				:question_id => Faker::Number.between(1, 20)
				) 
		end
	end
end

# TaskSeed.faker