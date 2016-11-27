require "pry"
require_relative "./post.rb"

class Blog

    attr_accessor :posts
    def initialize
        @posts = []
    end

    def add_post(post)
        @posts.push(post)
    end

    def select_auth
        @posts.keys.select { |key| key.to_s.match(params[:author]) }
    end

    def latest_post
        @posts.sort {|post1, post2| post2.date <=> post1.date}
    end

    def show_posts
    	@posts.each { |post| print post.title + ": " + post.text + "\n"}
    end
    def posts_array
    	@posts_ar = []
    	@posts_ar.push ( @posts.each { |post| post.title } )
    	@posts_ar
    end
end