get '/' do
	@user = User.all
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
	if User.authenticate(params[:email],params[:password])
		session[:user_id] = @user.id
		redirect '/'
	else
		@error = 'Sorry you weren\'t found'
		erb :sign_in
	end
end

delete '/sessions/:id' do
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
	user	= User.new(params[:user])
	if user.save
		session[:user_id] = user.id
		redirect '/'
	else
		####error messages
		erb :sign_up
	end
  # sign-up a new user
end
