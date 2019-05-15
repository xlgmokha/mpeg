RSpec.describe Mpeg::Lookahead do
  def str(string)
    Mpeg::Str.new(string)
  end

  def any
    Mpeg::Re.new('.')
  end

  subject { str('"').absent? >> any.repeat }

  specify { expect(subject.parse('"Hello')).to be_falsey }
  specify { expect(subject.parse('Hello')).to be_truthy }
end
