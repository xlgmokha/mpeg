module Mpeg
  class Transaction
    def initialize(scanner)
      @scanner = scanner
      @rewind_position = @scanner.pos
      @commit = false
    end

    def commit!
      @commit = true
    end

    def run(&block)
      block.call(self)
    ensure
      @scanner.pos = @rewind_position unless @commit
    end
  end
end
