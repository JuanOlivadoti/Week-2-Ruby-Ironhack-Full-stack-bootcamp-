require_relative "./lib/post.rb"
require_relative "./lib/blog.rb"
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

@@blog = Blog.new
post1=Post.new("Greetings 001", "Hi, there!!", "New day","Juan Pablo")

@@blog.add_post Post.new("Greetings 020", "Ai Ai, captain!!", "Past days","Juan Pablo")
@@blog.add_post Post.new("Greetings 300", "Hello world!!", "New day","Juan Pablo")
@@blog.add_post post1
@@blog.add_post Post.new("Greetings 020", "Ai Ai, captain!!", "Past days","Pedro")
@@blog.add_post Post.new("Greetings 300", "Hello world!!", "New day","Pedro")


get("/") do
	@ordered_posts = @@blog.latest_post
  erb(:index)
end

get "/post/:index" do

	@sorted_posts = @@blog.show_posts
	@index = (params[:index]).to_i
	@title = @sorted_posts[@index].title
	@date = @sorted_posts[@index].date
	@text = @sorted_posts[@index].text
	@category = @sorted_posts[@index].category
	@author = @sorted_posts[@index].author
	erb(:post)

end

get "/author/:author" do

	@author = params[:author]
	#binding.pry
	@author_posts = @@blog.posts.select { |post| post.author == @author }
	# @author_posts.each { |x| x.text}
	# @title = @sorted_posts.title
	# @date = @sorted_posts[@author].date
	# @text = @sorted_posts[@author].text
	# @category = @sorted_posts[@author].category
	erb(:author)

end

# blog.show_posts

# blog.posts_array

# blog.latest_post