module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    length.times do |i|
      yield self[i]
    end

    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

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
  
  def my_all?(*pat)
    if block_given?
      my_each do |elem|
        return false unless yield elem
      end
    else
      my_each do |elem|
        return false unless pat[0] === elem
      end
    end

    true
  end
end
