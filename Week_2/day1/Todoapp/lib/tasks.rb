require 'pry'
require 'yaml/store'
require_relative 'todolist.rb'

class Task
    attr_accessor :content, :id, :created_at
    @@current_id = 1
    def initialize(content)
        @created_at = Time.now
        @content = content
        @@current_id += 1
        @completed = false
        @updated_at = nil
        @id = (@created_at.to_i ** @@current_id)% 999999 ##
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
