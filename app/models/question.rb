class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	has_many :answers
	has_many :question_votes
	belongs_to :user

	validates :title, presence: true
	validates :user_id, presence: true

	def votecount
		total=0
		QuestionVote.where(question_id: self.id).all.each do |x|
			total+=x.vote			
		end
		total
	end

end
