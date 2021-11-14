module Enumerable
  def my_each
    return to_enum unless block_given?

    length.times do |i|
      yield self[i]
    end

    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    length.times do |i|
      yield self[i], i
    end

    self
  end

  def my_select
    return to_enum unless block_given?

    results = []
  end 
end
