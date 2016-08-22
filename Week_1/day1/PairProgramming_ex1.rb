class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]

def array_printer(array)
  array.each do | language |
    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
  end
end

# array_printer(array_of_languages)

aged_languages = array_of_languages.map do |lang|
  lang.age+=1
  lang
end
puts "The programming languages aged one year are: "
# array_printer(aged_languages)

sorted_languages = aged_languages.sort {|x,y| y.age <=>x.age}

# array_printer(sorted_languages)

no_java = array_of_languages.delete_if {|lang| lang.name=="Java"}
# array_printer(sorted_languages.reverse) #reverse, cycle, flatten

# puts array_of_languages
array_printer(array_of_languages)
array_of_languages.map! { | language | language.name += "g"
language}
# array_printer(array_of_languages)
array_of_languages.inspect
