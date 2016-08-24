require_relative '../lib/sinatraTODO.rb'
require 'pry'
require 'yaml/store'

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

describe "#completed attr" do
  it "checks that a new time variable was created and the time is different" do
    expect(@task.created_at<=>Time.now).to eq((-1))
  end
end

describe "#completed attr" do
  it "checks that a new time variable was created and the day is same" do
    expect((@task.created_at).day==Time.now.day).to eq((true))
  end
end

describe "#update_content!" do
  it "changes a tasks content" do
    expect(@task.update_content!("new content")).to eq(("new content"))
  end
end
end#end class



RSpec.describe TodoList do
  before :each do
  @list = TodoList.new("John")
  @singletask = Task.new("pass this test")
  @singletask2 = Task.new("i like cats")
  @singletask3 = Task.new("this should be last")
end

describe "#add_task" do
  it "adds single task to our array of tasks" do
    @list.add_task(@singletask)
    @list.add_task(@singletask2)
    expect(@list.tasks.size).to eq(2)
  end
end

describe "#delete_task" do
  it "deletes task from task array by its ID. first tests that task is actually added, then deleted" do
    a = @list.add_task(@singletask).size
    @list.delete_task(@singletask.id)
    expect(a == 1 && @list.tasks.empty?).to eq(true)
  end
end

describe "#find_task_by_id" do
  it "searches the tasks array and returns the one with matching IDs" do
    @list.add_task(@singletask)
    @list.add_task(@singletask2)
    search_id = @singletask2.id
    expect(@list.find_task_by_id(search_id)).to eq("i like cats")
  end
end

describe "#find_task_by_id nil when array empty" do
  it "should return nil" do
    search_id = @singletask.id
    expect(@list.find_task_by_id(search_id)).to eq(nil)
  end
end

describe "#sort_by_created" do
  it "sort tasks based on time created" do
    task1 = Task.new("doit")
    task2 = Task.new("now")
    task3 = Task.new("yesterday")
    @list.add_task(task3)
    @list.add_task(task1)
    @list.add_task(task2)
    @list.sort_by_created("asc")
    task_arr = @list.tasks
    expect(task_arr[0].created_at > task_arr[-1].created_at).to eq(true)
  end
end

describe "#check that new user is added to Todolist Class" do
  it "should be able to read the user" do
    # binding.pry
    expect(@list.user).to eq("John")
  end
end


end
