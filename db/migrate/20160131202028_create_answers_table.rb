class CreateAnswersTable < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.text :content
			t.string :headline
			t.belongs_to :question, index: true
			t.belongs_to :user, index: true
		end
	end
end
