
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

	return {id: newvote.answer_id, votecount: Answer.find(newvote.answer_id).votecount}.to_json

	# redirect '/questions'
end