module Mpeg
  class Base
    def parse(string)
      call(Input.new(string))
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

  class Slice
    def initialize(position, string)
    end
  end

  class Input
    def initialize(string)
      @scanner = StringScanner.new(string)
    end

    def matches?(pattern)
      @scanner.match?(pattern)
    end

    def consume(characters)
      position = @scanner.pos
      slice = @scanner.scan(/(.|$){#{characters}}/m)

      Slice.new(position, slice)
    end
  end

  class Lookahead < Base
    def initialize(parser, positive)
      @parser = parser
      @positive = positive
    end
  end

  class Sequence < Base
    def initialize(left, right)
      @left = left
      @right = right
    end

    def call(input)
      @left.call(input) && @right.call(input)
    end
  end

  class Alternative < Base
    def initialize(left, right)
      @left = left
      @right = right
    end

    def call(input)
      @left.call(input) || @right.call(input)
    end
  end

  class Repitition < Base
    def initialize(parser, min, max)
      @parser = parser
      @min = min
      @max = max
    end

    def call(input)
      occurrences = 0
      loop do
        break unless @parser.call(input)
        occurrences += 1
        return false if @max && occurrences > @max
      end
      occurrences >= @min
    end
  end

  class Re < Base
    def initialize(regex)
      @regex = Regexp.new("[#{regex}]", Regexp::MULTILINE)
    end

    def call(input)
      if input.matches?(@regex)
        input.consume(1)
        return true
      end
      false
    end
  end

  class Str < Base
    def initialize(string)
      @length = string.size
      @regex = Regexp.new(Regexp.escape(string))
    end

    def call(input)
      if input.matches?(@regex)
        input.consume(1)
        return true
      end
      false
    end
  end

  class Parser
    def parse(string)
      root.parse(string)
    end

    private

    def root
      alpha.repeat(1, nil) >> comparison_operator >> string
    end

    def alpha
      Re.new('a-zA-Z')
    end

    def comparison_operator
      equal | not_equal
    end

    def equal
      str('eq')
    end

    def not_equal
      str('ne')
    end

    def string
      quote >> (str('\\') >> any | str('"').absent? >> any).repeat >> quote
    end

    def quote
      str('"')
    end

    def str(string)
      Str.new(string)
    end

    def any
      Re.new('.')
    end
  end
end
