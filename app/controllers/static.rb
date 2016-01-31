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
	if user
		if user.password == params[:password]
			session["email"] = params[:email]
			#{}"ss start"
			#erb :"questions/top_stories"
			redirect '/top_stories'
		else
			#erb :"users/signup"
			redirect '/'
		end
	else
		redirect '/'
	end

	
end

get '/logout' do
	session["email"] = nil

	redirect '/'
end

get '/users/:id' do

	if logged_in?
		questions = Question.where(user_id: params[:id])
		answers = Answer.where(user_id: params[:id])

		erb :"users/profile" ,locals: {questions: questions,answers: answers} 
	else
		redirect "/"
	end
	
end

get '/top_stories' do
	questions = Question.all

	if questions
		erb :"questions/top_stories" ,locals: {questions: questions} 
	else
		"Not found questions"
	end
end

get '/question/:id' do

	if logged_in?
		question = Question.find_by(id: params[:id])

		if question
			erb :"questions/question" ,locals: {question: question} 
		else
			redirect "/top_stories"
		end
	else
		redirect "/"

	end

end