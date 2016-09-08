class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password
	validates :email, presence: true
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	has_many :questions
	has_many :answers
	has_many :question_votes
	has_many :answer_votes
	def self.authenticate(email, password)
		self.find_by(email: email).try(:authenticate, password)
	end

end
