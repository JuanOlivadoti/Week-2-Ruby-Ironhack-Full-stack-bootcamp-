# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe 'The Irontwit' do
  context "homepage" do
    before (:each) { get("/")}

    it "renders the homepage" do
      expect(last_response).to be_ok
    end

    it "has a form" do
      expect(last_response.body).to include("form")
    end

  end

  it "adds a user" do
    size = @@users.size
    post('/register')
    expect(@@users.size)to eq(size + 1)
  end

  context "logout" do

    it "should set the session as logged out" do
      get("/logout")
      expect(session[:logged_in])to be_falsey

    end

  end

  describe "loggin" do
    it "'return 'Invalid user or password' if user or pass are 'asdas' 'asdasd'" do
      post("/auth/loggin",username: "asdas", password: "asdasd") 
      expect(last_response.body).to include("Invalid user")
    end



    context "user valid 'jimeno0' & pass '1234'" do
      before (:each){post("/auth/loggin",username: "jimeno0", password: "1234")}

  Testea que el registro funciona

  before (:each) do
    @users = [User.new("jimeno0", "1234")]
    post("/auth/loggin", username: "jimeno0", password: "1234")
  end

      it "logged equals true" do
        expect(session[:logged]).to be true
      end

      it "username to be jimeno0" do
        expect(session[:username]).to eq("jimeno0")
      end

      it "logged equals true" do
        expect(session[:logged]).to be true
      end
    end


  end

end