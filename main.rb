module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    length.times do |i|
      yield self[i]
    end

    self
  end

  def my_each_with_index(*args)
    unless block_given?
      return args.empty? ? to_enum(:my_each_with_index) : to_enum(:my_each_with_index, args)
    end

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
    end

    unless pattern.nil?
      my_each do |elem|
        return false unless pattern === elem
      end
    end

    true
  end
end
