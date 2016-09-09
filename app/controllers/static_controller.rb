get '/' do
	if logged_in?
		@questions=Question.all
		@users=User.all
		erb :"static/index"
	else
		erb :"static/login"
	end
end
