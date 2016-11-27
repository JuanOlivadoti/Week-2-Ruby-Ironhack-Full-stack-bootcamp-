class User
  attr_accessor :name, :password
  def initialize(name, password)
    @name = name
    @password = password
  end
  def self.user_valid?(users, name,password)

  end
end