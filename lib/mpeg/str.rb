module Mpeg
  class Str < Base
    def initialize(string)
      @length = string.size
      @regex = Regexp.new(Regexp.escape(string))
    end

    def call(input)
      if input.matches?(@regex)
        input.consume(@length)
        return true
      end
      false
    end
  end
end
