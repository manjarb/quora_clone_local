class AnswerVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :answer
	self.inheritance_column = nil
end
