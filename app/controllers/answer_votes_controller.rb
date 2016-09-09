
post "/answer_votes" do

	newvote=AnswerVote.new(params[:answer_vote])
	
	unless newvote.save
		existingvote=AnswerVote.find_by(answer_id: params[:answer_vote][:answer_id], user_id: params[:answer_vote][:user_id])
		
		if existingvote.vote==newvote.vote
			existingvote.vote=0
			existingvote.save
		else
			existingvote.update(params[:answer_vote])
		end
	end
	redirect '/questions'
end