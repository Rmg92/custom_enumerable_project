module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for element in self do
      yield element, index
      index += 1
    end
    self
  end

  def my_select
    values = []
    my_each { |element| values << element if yield element }
    values
  end

  def my_all?
    values = []
    my_each { |element| values << element if yield element }
    eql?(values)
  end

  def my_any?
    values = []
    my_each { |element| values << element if yield element }
    values.size.positive?
  end

  def my_none?
    values = []
    my_each { |element| values << element if yield element }
    values.empty?
  end

  def my_count
    if block_given?
      values = []
      my_each { |element| values << element if yield element }
      values.size
    else
      size
    end
  end

  def my_map
    values = []
    my_each { |element| values << yield(element) }
    values
  end

  def my_inject(initialvalue)
    value = initialvalue
    my_each { |element| value = yield(element, value) }
    value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self do
      yield element
    end
    self
  end
end
