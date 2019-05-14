module Mpeg
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
end
