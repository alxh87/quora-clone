get '/' do
	if logged_in?
		erb :"static/index"
	else
		erb :"static/login"
	end
end
