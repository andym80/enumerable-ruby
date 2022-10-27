# Enumerable module to check if all, any and filter work
module MyEnumerable
  def all?
    if block_given?
      my_each { |item| return false unless yield(item) }
      true
    else
      all? { |obj| obj }
    end
  end

  def any?
    if block_given?
      my_each { |item| return true if yield(item) }
      false
    else
      any? { |obj| obj }
    end
  end

  def filter
    if block_given?
      res = []
      my_each { |item| res << item if yield(item) }
      res
    else
      self
    end
  end
end
