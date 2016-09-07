class CreateAnswers < ActiveRecord::Migration
	def change
			create_table :questions do |t|
			t.string :answer
			t.integer :question_id
			t.integer :user_id
			t.timestamps
	end
end
