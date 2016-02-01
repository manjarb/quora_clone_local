class CreateVoteTable < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.string :type
			t.belongs_to :question, index: true
		end
		create_table :answer_votes do |t|
			t.string :type
			t.belongs_to :answer, index: true
		end
	end
end
