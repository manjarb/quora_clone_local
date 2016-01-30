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

enable :sessions

post '/login' do
	user = User.find_by(email: params[:email])
	if user.password == params[:password]
		session["email"] = params[:email]
		#{}"ss start"
		erb :"questions/top_stories"
	else
		erb :"users/signup"
	end
	
end

get '/logout' do
	session["email"] = nil

	erb :"users/signup"
end