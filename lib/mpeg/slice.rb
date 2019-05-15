module Mpeg
  class Slice
    def initialize(position, string)
      @position = position
      @string = string
    end

    def to_s
      "#{@string}@#{@position}"
    end

    def inspect
      to_s
    end
  end
end
