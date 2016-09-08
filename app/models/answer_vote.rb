class AnswerVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :answer
	belongs_to :user
	validates :user_id, presence: true
	validates :answer_vote, presence: true
	validates :user_id, uniqueness: { scope: :answer_id}
end
