module Mpeg
  class Base
    def parse(string)
      input = Input.new(string)
      call(input)
      input.end?
    end

    def repeat(min = 0, max = nil)
      Repitition.new(self, min, max)
    end

    def |(parser)
      Alternative.new(self, parser)
    end

    def >>(parser)
      Sequence.new(self, parser)
    end

    def absent?
      Lookahead.new(self, false)
    end
  end
end
