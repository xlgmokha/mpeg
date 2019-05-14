module Mpeg
  class Lookahead < Base
    def initialize(parser, positive)
      @parser = parser
      @positive = positive
    end
  end
end
