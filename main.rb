module Enumerable
  def my_each
    return to_enum unless block_given?

    for el in self do
      yield el
    end
  end
end
