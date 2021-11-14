module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    length.times do |i|
      yield self[i]
    end

    self
  end

  def my_each_with_index(*args)
    return to_enum(:my_each_with_index, *args) unless block_given?

    length.times do |i|
      yield self[i], i
    end

    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    results = []

    my_each do |elem|
      results.push(elem) if yield elem
    end
    results
  end

  def my_all?(pattern = nil)
    if block_given?
      my_each do |elem|
        return false unless yield elem
      end
    else
      my_each do |elem|
        return false unless pattern === elem
      end
    end

    true
  end

  def my_any?(pattern = nil)
    if block_given?
      my_each do |elem|
        return true if yield elem
      end
    else
      my_each do |elem|
        return true if pattern === elem
      end
    end

    false
  end

  def my_none?(pattern = nil)
    if block_given?
      my_each do |elem|
        return false if yield elem
      end
    else
      unless pattern.nil? # Pattern provided
        my_each do |elem|
          return false if pattern === elem
        end
      else
        my_each do |elem|
          return false if false ^ elem
        end
      end
    end

    true
  end
end
