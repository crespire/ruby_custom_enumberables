module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for el in self do
      yield el
    end
    self
  end

  def my_each_with_index(*args)
    return to_enum(:my_each_with_index, *args) unless block_given?

    i = 0
    for el in self do
      yield el, i
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    results = []
    my_each { |elem| results.push(elem) if yield elem }
    results
  end

  def my_all?(pattern = nil)
    expr = block_given? ? ->(elem) { yield elem } : ->(elem) { pattern === elem }
    my_each { |elem| return false unless expr.call(elem) }
    true
  end

  def my_any?(pattern = nil)
    expr = block_given? ? ->(elem) { yield elem } : ->(elem) { pattern === elem }
    my_each { |elem| return true if expr.call(elem) }
    false
  end

  def my_none?(pattern = nil)
    expr = ->(elem) { yield elem } if block_given?
    expr = pattern ? ->(elem) { pattern === elem } : ->(elem) { false ^ elem } unless block_given?
    my_each { |elem| return false if expr.call(elem) }
    true
  end

  def my_count(item = nil)
    return length if item.nil? && !block_given?

    count = 0
    expr = block_given? ? ->(elem) { count += 1 if yield elem } : ->(elem) { count += 1 if item === elem }
    my_each { |elem| expr.call(elem) }
    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    result = []
    my_each { |elem| result << yield(elem) }
    result
  end
end
