require_relative 'lexiconomitron.rb'

RSpec.describe Lexiconomitron do
  before :each do
    @lexi = Lexiconomitron.new
  end

  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do
    it "reverses the letters of each array element when they are strings" do
      expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
    end
  end

  describe "#oompa_loompa" do
    it "takes an array of words and discards all words 4 letters and more" do
    expect(@lexi.oompa_loompa(["This", "is", "a", "boring", "test"])).to eq(["is","a"])
  end
end

  describe "#oompa_loompa" do
    it "takes an array of words and discards all words 4 letters and more" do
    expect(@lexi.oompa_loompa(["let's", "all", "just","get","along"])).to eq(["all","ge"])
  end
end

end #Class
