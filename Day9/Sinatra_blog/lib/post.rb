require "pry"
require "date"

class Post
    attr_accessor :title, :text, :category, :author, :date
    def initialize(title, text, category, author)
        @title = title
        @text = text
        @category = category
        @author = author
        @date = Time.now
    end
end