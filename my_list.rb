require_relative 'my_enumerable'

class MyList
  include MyEnumerable
  attr_reader :list

  def initialize(*list)
    @list = list
  end

  def my_each()
    (0...@list.length).each { |item| yield @list[item] }
  end
end

list = MyList.new(1, 2, 3, 4)

p list.list
puts('Test #all?')
puts(list.all? { |e| e < 5 })
# true
puts(list.all? { |e| e > 5 })
# false

puts('Test #any?')
puts(list.any? { |e| e == 2 })
# true
puts(list.any? { |e| e == 5 })
# false

puts('Test #filter')
p(list.filter(&:even?))
# [2. 4]