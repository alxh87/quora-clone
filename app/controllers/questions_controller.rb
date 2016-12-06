
get "/questions" do
	if logged_in?
		@questions=Question.all
		erb :"questions/index"
	else
		erb :"static/login"
	end
end

get "/questions/new" do
	if logged_in?
		@questions=Question.all
		erb :"/questions/new"
	else
		erb :"static/login"
	end	
end

post "/questions" do
	if logged_in?
		Question.create(params[:question])
		@questions=Question.all
		erb :"/questions/index"
	else
		erb :"static/login"
	end	
end

get "/questions/:id" do
	@question=Question.find(params[:id])
	@questions=Question.all
	erb :"/questions/show"
end

get "/questions/:id/edit" do
	# byebug
	if logged_in?
		@questions=Question.all
		@question=Question.find(params[:id])
		erb :"/questions/edit"
	else
		redirect "/"
	end
end

put "/questions/:id/update" do
	if logged_in?
		@questions=Question.all
		Question.find(params[:id]).update(params[:question])
		redirect "/questions/"+(params[:id])
	else
		redirect "/"
	end
end

get "/questions/:id/delete" do
	# byebug
	if logged_in?
		@questions=Question.all
		@question=Question.find(params[:id])
		erb :"/questions/delete"
	else
		redirect "/"
	end
end

delete "/questions/:id" do
	@questions=Question.all
	Question.find(params[:id]).delete
	redirect "/questions"
end