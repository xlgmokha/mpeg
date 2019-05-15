module Mpeg
  class Lookahead < Base
    def initialize(parser, positive)
      @parser = parser
      @positive = positive
    end

    def call(input)
      input.rewind do
        result = @parser.call(input)
        @positive ? result : (result ? false : true)
      end
    end
  end
end
