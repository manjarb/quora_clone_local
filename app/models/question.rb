class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user

	self.per_page = 10
end
