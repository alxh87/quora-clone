
post "/signup" do
	user=User.new(params[:user])
	if user.save
		session[:user_id] = user.id
		redirect '/homepage'

	else
		@error = user.errors.full_messages #@error allows html to read the var
		erb :"static/index"
	end
end


post '/logout' do
	session[:user_id] = nil
	redirect '/'
end


post '/login' do
	user = User.authenticate(params[:user][:email], params[:user][:password])
	
	if user
		session[:user_id]=user.id
		redirect '/' 
	else
		@error = "Wrong password or email"
		erb :"static/index"
	end

end

post "/create_username" do
	User.addName(session[:user_id], params[:user][:name])
	'/homepage'
end
