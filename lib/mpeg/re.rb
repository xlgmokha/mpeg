module Mpeg
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
end
