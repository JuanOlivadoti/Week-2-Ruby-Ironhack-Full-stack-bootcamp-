require 'sinatra'
require 'sinatra/reloader' if development?

enable(:sessions)

get "/" do
	erb(:add)
end

post "/calculate_add" do
	# Stores the numbers that were entered (as floats)
	@first_number = params[:first_num].to_f
	@second_number = params[:second_num].to_f

	#puts params.inspect

	# Stores which operation button was pressed
	#@operation = params["operation"]
	erb(:calculate_add)
end

# post "/calculate_add" do
#   "Params data: " + params.inspect
# end
