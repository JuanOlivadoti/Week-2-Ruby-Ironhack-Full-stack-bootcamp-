require 'sinatra'
require "sinatra/reloader" if development?

DB = {:users{:Juan 1234, :Pablo 4567}}

enable(:sessions)

get '/' do
  erb(:index)
end

get '/hours/ago/:time_ago' do
  @hours_ago = params[:time_ago].to_i
  @time_ago = Time.now - (@hours_ago * 360 * 60)
  erb(:hours_ago)
end

get '/urldelinfierno' do
  @titulo = "Hoy es dia #{Date.today.to_s}"

  erb(:infierno)
end

get '/urldelnoinfierno/:name' do
  params[:name] ||= "Bob"
  @titulo = "Hoy no estas en el infierno, #{params[:name]}"

  erb(:no_infierno)
end
