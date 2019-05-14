module Mpeg
  class Sequence < Base
    def initialize(left, right)
      @left = left
      @right = right
    end

    def call(input)
      @left.call(input) && @right.call(input)
    end
  end
end
