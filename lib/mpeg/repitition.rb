module Mpeg
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
end
