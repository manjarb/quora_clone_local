get '/' do
  #erb :"static/index"
  erb :"users/signup"
end

post '/signup' do
	user = User.new(params[:user])
	if user.save
		"donee"
	else
		user.errors.full_messages
	end

	#user = User.create(params[:user])
end

get '/user/list' do
	user = User.new
	# user.list.each { |x|
	# 	puts "#{x.attributes['id']}. #{x.attributes['username']}"
	# }
end

post '/login' do
	user = User.find_by_email(params[:email])
	if user.password == params[:password]
		"give_token"
	else
		"redirect_to home_url"
	end
	
end

post '/logout' do
	
end