require_relative 'sinatraTODO.rb'

RSpec.describe Task do
  before :each do
  @task = Task.new("Finish Lexiconomitron")
end

describe "#completed?" do
  it "returns either T or F. All newly created Tasks should return F" do
    expect(@task.completed?).to eq(false)
  end
end

describe "#complete!" do
  it "Marks task as done, and thus the @completed = true" do
    expect(@task.complete!).to eq(true)
  end
end




end#end class
