module Mpeg
  class Sequence < Base
    def initialize(left, right)
      @left = left
      @right = right
    end

    def call(input)
      input.transaction do |x|
        result = @left.call(input) && @right.call(input)
        x.commit! if result
        result
      end
    end
  end
end
