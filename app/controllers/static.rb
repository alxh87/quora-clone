get '/' do
  erb :"static/index"
end

get '/homepage' do	
	erb :"static/homepage"
end

get '/profile' do
	if logged_in?
		@user=current_user
		erb :"static/profile"
	else
		@error = "Not logged in"
		erb :"static/index"
	end
end


get '/users/:id' do
	@user=User.find(params[:id])
	erb :"static/profile"
end

get '/login' do
	erb :"static/login"
end