require 'ruby-dictionary'
require 'pry'

class WordChain
    attr_accessor :dictionary
    def initialize(dictionary)
        @dictionary = dictionary
    end

    def find_chain(word1,word2)
        @word1 = word1
        @word2 = word2.dup
        i=0
        puts word1.join('')
        # checker = word1.dup
        until (@word1 == @word2) || (i == 20) do
            checker = word1
            (checker[i] = @word2[i])#dup
            if @dictionary.exists?(checker.join(''))
                (word1 = checker)
                # i+=1
            else
                word1 = @word1
                i+=1
                binding.pry
            end #if
           puts word1.join('')
        end #until
    end#def
end

=begin

class GetInputs
    def initialize(startingword,endword)
        @startingword = startingword
        @endword = endword
    end
end

class Prepare_inputs < GetInputs

    def convert_to_array
        @startingword = @startingword.split("")
        @endword = @endword.split("")
    end

    def check_length
        unless @startingword.size == @endword.size #WORDS MUST BE SAME SIZE
            false
        else
            true
        end
    end

end

input = Inputs.new(a,b) #cann have a start class that puts the user input in here?

class CompareWords

     def compareletters(input)
         i=0
         checker = input.startingword
         until (input.startingword == input.endword) || i == 20 do
            (checker[i] = input.endword[i])
            if dictionary.exists?(checker)
                input.startingword = checker
                i+=1
            else
                i+=1
            end
         end #first if
     end


 end

compare = CompareWords.new.compareletters(input)
=end


# my_chain.find_chain
# my_chain.find_chain("cat", "dog")
# cat
# cot
# cog
# dog
=begin
class CompareWords
    attr_accessor :word1, :word2

    def initialize(dictionary)
        @dictionary = dictionary
    end


     def compareletters(word1,word2)
        i=0
         checker = word1
         until (word1 == word2) || i == 20 do
            (checker[i] = word2[i])
            if @dictionary.exists?(checker.join(''))
                word1 = checker
                i+=1
            else
                i+=1
           end #if
        #    puts word1.join('')
          end #until
    end#def
end
=end

a = ['c','a','t']
b = ['d','o','g']
dictionary = Dictionary.from_file('dictionary.txt')
my_chain = WordChain.new(dictionary)
my_chain.find_chain(a,b)
