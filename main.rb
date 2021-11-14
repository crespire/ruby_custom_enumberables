module Enumerable
  def my_each
    return to_enum unless block_given?

    for el in self do
      yield el
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    index = 0
    length.times do i
      yield self[i], index
      index += 1
    end
  end
end
