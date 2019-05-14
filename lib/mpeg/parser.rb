module Mpeg
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
