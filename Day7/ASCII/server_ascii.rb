require 'sinatra'
require "sinatra/reloader" if development?

DB = {users: {Juan: 1234, Pablo: 4567}}

enable(:sessions)

get '/' do
  @time_now = Time.now
  session[:twits] ||= []
  session[:insultodeldia] = [:tonto, :idiota, :vegetariano].sample
  erb(:index)
end

get '/ascii/word' do
  @time_now = Time.now
  erb(:inde)
end

get '/hours/ago/:time_ago' do
  @hours_ago = params[:time_ago].to_i
  @time_ago = Time.now - (@hours_ago * 60 * 60)
  erb(:index)
end

post '/crear_twit' do
  session[:twits] << params[:message]
  redirect to('/')
end
