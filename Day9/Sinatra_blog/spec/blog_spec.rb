# spec/spec_helper.rb
require_relative '../lib/blog.rb'
require_relative '../lib/post.rb'

require 'date'

RSpec.describe Blog do
	  
	blog = Blog.new

	blog.add_post Post.new("Greetings 001", "Hi, there!!", "New day","Juan Pablo")
	blog.add_post Post.new("Greetings 020", "Ai Ai, captain!!", "Past days","Juan Pablo")
	blog.add_post Post.new("Greetings 300", "Hello world!!", "New day","Juan Pablo")

  describe "posts array is ok" do
  	it "blbl" do
      expect(blog.posts_array.class).to be(Array)
    end
  end

  
end