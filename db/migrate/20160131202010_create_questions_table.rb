class CreateQuestionsTable < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.text :content
			t.string :headline
			t.belongs_to :user, index: true
		end
	end
end
