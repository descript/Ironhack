require 'pry'
require 'yaml/store'
require_relative 'tasks.rb'

class TodoList
    attr_reader :tasks, :user

    def initialize(user)
        @todo_store = YAML::Store.new("./public/tasks.yml")
        @tasks = []
        @user = user
    end

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
        task_found.empty? ? nil : task_found[0]
    end

    def sort_by_created(order)
        order = order.downcase
        if order == "asc"
            tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
        elsif order == "desc"
            sorted_by_created = @tasks.sort! { | task1, task2 | task1.created_at <=> task2.created_at }
        end
    end#end class
    end
