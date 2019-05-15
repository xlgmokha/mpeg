module Mpeg
  class Str < Base
    def initialize(string)
      @length = string.size
      @regex = Regexp.new(Regexp.escape(string))
    end

    def call(input)
      return input.consume(@length) if input.matches?(@regex)
      false
    end
  end
end
