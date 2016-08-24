require_relative 'password.rb'
require 'pry'

RSpec.describe PasswordChecker do
  before :each do
    @password = PasswordChecker.new
end

describe "#not greater_than_7?" do
  it "FALSE since password is too short" do
    expect(@password.greater_7?("1234567")).to eq(false)
  end
end

describe "#greater_than_7?" do
  it "TRUE since password is over 7 chars" do
    expect(@password.greater_7?("12345678")).to eq(true)
  end
end

describe "#mix of characters" do
  it "TRUE since there are enough mixed chars" do
    expect(@password.mix_chars?("12345g!T")).to eq(true)
  end
end

describe "#mix of characters" do
  it "FALSE since missing an Uppercase letter" do
    expect(@password.mix_chars?("1234567!k")).to eq(false)
  end
end

describe "#names" do
  it "FALSE since domain is used in the password" do
    expect(@password.domain_incl?("email@server.com","email!G75")).to eq(false)
  end
end

describe "#names" do
  it "TRUE since domain is NOT being used in the password" do
    expect(@password.domain_incl?("email@server.com","1234Kg!9")).to eq(true)
  end
end

describe "#full check" do
  it "FALSE since name is in the password" do
    expect(@password.check_password("rafa@ironhack.com","12rafaT$LLL")).to eq(false)
  end
end

describe "#full check" do
  it "FALSE since domain is in the password" do
    expect(@password.check_password("rafa@ironhack.com","12ironhackT$LLL")).to eq(false)
  end
end

end
