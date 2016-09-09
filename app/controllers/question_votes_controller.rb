

post "/question_votes" do
	newvote=QuestionVote.new(params[:question_vote])
	
	unless newvote.save
		existingvote=QuestionVote.find_by(question_id: params[:question_vote][:question_id], user_id: params[:question_vote][:user_id])
		
		if existingvote.vote==newvote.vote
			
			existingvote.vote=0
			existingvote.save
		else
		
			existingvote.update(params[:question_vote])
		end
	end
	redirect '/questions'
end