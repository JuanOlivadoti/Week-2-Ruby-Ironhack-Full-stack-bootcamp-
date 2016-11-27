require 'sinatra'
require "sinatra/reloader" if development?

require_relative 'lib/twit.rb'
require_relative 'lib/user.rb'
require 'pry'

enable(:sessions)

@@users = []

before '/profile' do
   unless session[:logged_in] 
    redirect to('/')
	end
end

get '/' do
	if session[:logged_in]
		redirect to('/profile')
	end
  erb(:index)
end

post '/register' do
  @user = User.new(params[:username], params[:password])
  @@users << @user
	session[:username] = params[:username]
  session[:logged_in] = true
  	#binding.pry

  redirect to('/profile')
end

post '/login' do
		#binding.pry

  if @@users.find {|user| user.name == (params[:username]) && user.password == (params[:password]) }
  	session[:username] = params[:username]
  	session[:logged_in] = true
  	redirect to('/profile')
	else
		session[:logged_in] = false
		redirect to('/')
	end
end

get '/profile' do
	if session[:twits]
  	@twits = session[:twits].select{|twit| twit.username == session[:username]}
  	if !@twits 
  		@twits = []
  	end
  else
  	session[:twits]=[]
  	@twits = []

  end
  erb(:profile)
end

get "/logout" do
  session[:logged_in] = false
  redirect to("/")
end

post '/crear_twit' do
  @twit = Twit.new(params[:message], session[:username])
  session[:twits] << @twit
  redirect to('/profile')
end
#binding.pry