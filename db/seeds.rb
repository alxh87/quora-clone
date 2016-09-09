
require 'faker'


10.times do
 	User.create(:name => Faker::Name.name, :email=>Faker::Internet.email, :password_digest=>123)
 end

20.times do
 Question.create(:title => Faker::Hipster.sentence,
 	:body =>  Faker::Hipster.paragraph, :user_id => (1..5).to_a.sample)
end

100.times do
 Answer.create(:answer =>  Faker::Lorem.paragraph, :user_id => (1..5).to_a.sample, :question_id =>(1..20).to_a.sample)
end

300.times do
	QuestionVote.create(:user_id => (1..10).to_a.sample, :question_id=>(1..20).to_a.sample, :vote=>[-1,0,1,1,1].sample)
end

1500.times do
	AnswerVote.create(:user_id => (1..10).to_a.sample, :answer_id=>(1..100).to_a.sample, :vote=>[-1,0,1,1,1].sample)
end