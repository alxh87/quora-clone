class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	belongs_to :question
	belongs_to :user
	has_many :answer_votes
	validates :answer, presence: true
	validates :user_id, presence: true
	validates :question_id, presence: true

	def votecount
		total=0
		AnswerVote.where(answer_id: self.id).all.each do |x|
			total+=x.vote			
		end
		total
	end

end
