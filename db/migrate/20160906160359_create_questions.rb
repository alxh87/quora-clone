class CreateQuestions < ActiveRecord::Migration
	def change
			create_table :questions do |t|
			t.string :title
			t.string :subject
			t.integer :user_id
			t.timestamps
	end
end
