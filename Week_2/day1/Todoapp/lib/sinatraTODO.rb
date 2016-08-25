require 'pry'
require 'yaml/store'
require 'yaml'
gem 'psych'
require 'psych'

module Storage
    attr_accessor :todo_store
    @todo_store = YAML::Store.new("./public/tasks.yml")

    def save
        @todo_store.transaction do
            @todo_store[@user] = @tasks
        end
    end

    def load_tasks
        prev_state = YAML.load_file("./public/tasks.yml")
        @tasks = prev_state[@user]
        @tasks
    end
end

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


class TodoList
    include Storage
    attr_reader :tasks, :user

    def initialize(user)
        @tasks = []
        @user = user
    end

    def add_task(task)
        @tasks << task
    end

    def get_tasks
        @tasks
    end

    def delete_task(input_id)
        @tasks.delete_if {|task| task.id == input_id}
    end

    def find_task_by_id(input_id)
        task_found = @tasks.select {|task| task.id == input_id}
        task_found.empty? ? nil : task_found[0].content
    end

    def sort_by_created(order)
        order = order.downcase
        if order == "asc"
            tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
        elsif order == "desc"
            sorted_by_created = @tasks.sort! { | task1, task2 | task1.created_at <=> task2.created_at }
        end
    end
end#end class

# todo_list = TodoList.new("jason")
# task = Task.new("pwn n00bs")
# task2 = Task.new("be nice now")
# task3 = Task.new("learn to be cool")
#
# todo_list.add_task(task)
# todo_list.add_task(task2)
# todo_list.add_task(task3)
#
# todo_list.save

# todo_list = TodoList.new("Josh")
# todo_list.load_tasks
# puts todo_list.tasks.length
