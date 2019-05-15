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

    def rewind
      transaction do |_|
        yield
      end
    end

    def transaction(&block)
      Transaction.new(@scanner).run(&block)
    end

    def end_of_string?
      @scanner.eos?
    end

    def position
      @scanner.pos
    end
  end
end
