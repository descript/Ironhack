require 'pry'

class Lexiconomitron
  def eat_t(string)
    string.gsub(/[Tt]/,"")
  end

  def shazam(arr)
    new_arr = arr.map {|word| eat_t(word.reverse)}
    new_arr = [new_arr[0],new_arr[-1]]
  end

  def oompa_loompa(arr)
    arr.delete_if {|word| word.size>3}.map {|word| eat_t(word)}
  end#end method

end#end class

# lexi = Lexiconomitron.new
# lexi.oompa_loompa(["This", "is", "a", "boring", "test"])
