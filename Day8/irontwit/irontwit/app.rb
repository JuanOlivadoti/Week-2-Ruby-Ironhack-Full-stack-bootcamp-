require 'sinatra'
require 'haml'
require 'pry'
require "sinatra/reloader" if development?
require_relative 'lib/user.rb'

set :haml, format: :html5
enable(:sessions)

@@users = []

def validate_user?
	valid = @@users.select { |user| @user.name == params[:username] && @user.password == params[:password] }
	if valid

	else

	end
	
end

get '/' do
  erb(:index)
end

post '/register' do
  @user = User.new(params[:username], params[:password])
  @@users << @user
  session[:logged_in] = true
  redirect to('/profile')
end

post '/login' do
  erb(:login)
  @@users.validate_user
  session[:logged_in] = true
  redirect to('/profile')
end



get '/profile' do
  @twits = []
  erb(:profile)
end

get "/logout" do
  session[:logged_in] = false
  redirect to("/")
end
