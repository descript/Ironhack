require 'pry'

class Task
    attr_reader :content, :id
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed = false
    end

    def completed?
        @completed
    end

    def complete!
        @completed = true
    end

    def make_incomplete!
        @completed = true
    end

end

task = Task.new("pwn n00bs")
task.completed?
task.complete!
