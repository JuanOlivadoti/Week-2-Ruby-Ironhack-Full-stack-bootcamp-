require 'sinatra'
require 'pry'
require 'haml'
require "sinatra/reloader" if development?

require_relative 'lib/twit.rb'
require_relative 'lib/user.rb'

set :haml, format: :html5
enable(:sessions)

@@users = []
before 'admin/*' do 
	if session[:logged]
		redirect to("/my_page")
	else 
		erb(:index)
	end
end

get '/' do
	erb(:index)
end

post '/register' do 
	@user = User.new(params[:username], params[:password])
	if @user.name == "" || @user.password == "" 
  		@error = "Usuario o contrasena en blanco"
  		erb(:index)
  	else
  		@@users << @user
  		redirect to('/')
  	end
end

post '/login' do
	binding.pry
	@@users.select{|user| @user.name == && params[:password]
	session[:logged_in] = true
  	redirect to('/profile')
end

get '/profile' do 
  @twits = []
  erb(:profile)
end

post '/logout' do
	session[:logged_in] = false
  	redirect to("/")
end

# get '/' do
#   session[:twits] ||= []
#   session[:insultodeldia] = [:tonto, :idiota, :vegetariano].sample
#   erb(:index)
# end


post '/crear_twit' do
  @twit = Twit.new(params[:message],)
  session[:twits] << @twit.msg
  erb(:hours_ago)
end