
post "/answer" do

	answer=Answer.new(params[:answer])
	if answer.save
		@questions=Question.all
		return {answer: answer, user: answer.user}.to_json
		# redirect "/questions/#{(params[:answer][:question_id])}"
	else
		@questions=Question.all
		return answer.errors.full_messages.to_json #@error allows html to read the var
		# @question=Question.find(params[:answer][:question_id])
		# redirect "/questions/#{(params[:answer][:question_id])}?error=#{@error}"
	end


end

get "/answers/:id/edit" do
	# byebug
	if logged_in?
		@questions=Question.all
		@answer=Answer.find(params[:id])
		erb :"/answers/edit"
	else
		redirect "/"
	end
end


put "/answers/:id/update" do
	if logged_in?
		@questions=Question.all
		Answer.find(params[:id]).update(params[:answer])
		redirect "/questions/#{(params[:answer][:question_id])}"
	else
		redirect "/"
	end
end

get "/answers/:id/delete" do
	# byebug
	if logged_in?
		@questions=Question.all
		@answer=Answer.find(params[:id])
		erb :"/answers/delete"
	else
		redirect "/"
	end
end

delete "/answers/:id" do
	@questions=Question.all
	answer=Answer.find(params[:id])
	question_id=answer.question_id
	# byebug
	answer.delete
	redirect "/questions/#{question_id}"
end