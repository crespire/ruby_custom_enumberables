module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    length.times { |i| yield self[i] }
    self
  end

  def my_each_with_index(*args)
    return to_enum(:my_each_with_index, *args) unless block_given?

    length.times { |i| yield self[i], i }
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    results = []
    my_each { |elem| results.push(elem) if yield elem }
    results
  end

  def my_all?(pattern = nil)
    if block_given?
      my_each { |elem| return false unless yield elem }
    else
      my_each { |elem| return false unless pattern === elem }
    end
    true
  end

  def my_any?(pattern = nil)
    if block_given?
      my_each { |elem| return true if yield elem }
    else
      my_each { |elem| return true if pattern === elem }
    end
    false
  end

  def my_none?(pattern = nil)
    expr = ->(elem) { yield elem } if block_given?
    expr = pattern ? ->(elem) { pattern === elem } : ->(elem) { false ^ elem } unless block_given?
    my_each { |elem| return false if expr.call(elem) }
    true
  end
end
