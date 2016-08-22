require 'pry'

class Task
    attr_accessor :content, :id, :created_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id ##
        @@current_id += 1
        @completed = false
        @created_at = Time.now
        @updated_at = nil
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

    def update_content!(new_content)
        @updated_at = Time.now
        @content = new_content
    end

end

task = Task.new("pwn n00bs")
task2 = Task.new("be nice now")
# task.completed?
# task.complete!


class TodoList
    attr_reader :tasks
    def initialize
        # @user = user
        @tasks = []
    end

    def add_task(task)
        @tasks << task
    end

    def delete_task(input_id)
        @tasks.delete_if {|task| task.id == input_id}
    end

    def find_task_by_id(input_id)
        task_found = @tasks.select {|task| task.id == input_id}
        task_found.empty? ? nil : task_found[0].content
    end

    def sort_by_created
        # order = order.downcase
        # binding.pry
        # if order == "asc"
            tasks.sort { | task1, task2 | task1.id <=> task2.id }
        # elsif order == "desc"
            # sorted_by_created = @tasks.sort! { | task1, task2 | task1.created_at <=> task2.created_at }
        # end
    end
end#end class

# list = TodoList.new
# list.add_task(task)
# list.add_task(task2)
# search_id = task.id
# list.sort_by_created("asc")
