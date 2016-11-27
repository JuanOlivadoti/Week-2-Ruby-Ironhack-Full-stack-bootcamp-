require_relative 'spec_helper.rb' #links with RSpec file in /spec. #Can be ../lib/lex.br (also)
require 'date'

describe Lexiconomitron do
  before :each do
    @lexi = Lexiconomitron.new
  end
  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  # describe "shazam" do
  #   it "reverses the words in an array and returns the first and the last" do
  #     expect(@lexi.shazam(["This", "is", "a", "boring", "test"]).to eq(["sih","se"])
  #   end
  # end
  #
  # describe "#oompa_loompa" do
  #   it "eliminates the words in an array with more than 3 letters" do
  #   expect(@lexi.oompa_loompa(["if", "you", "wanna", "be", "my","lover"]).to eq(["if", "you", "be", "my"]))
  # end
end
