=begin
#before
def say_hello(name)
  "hello #(name)"  # always puts "hello #(name)" as the syntax is wrong so it doesn't use the name argument
end
=end
#after
def say_hello(name)
  "hello #{name}"
end