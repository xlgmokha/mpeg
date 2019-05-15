RSpec.describe Mpeg::Repitition do
  context "with a min(1) and max(1)" do
    subject { Mpeg::Str.new('o').repeat(1, 2) }

    specify { expect(subject.parse('o')).to be_truthy }
    specify { expect(subject.parse('oo')).to be_truthy }
    specify { expect(subject.parse('ooo')).to be_falsey }
    specify { expect(subject.parse('mo')).to be_falsey }
  end

  context "when a min(1)" do
    subject { Mpeg::Str.new('o').repeat(1) }

    specify { expect(subject.parse('')).to be_falsey }
    specify { expect(subject.parse('mo')).to be_falsey }
    specify { expect(subject.parse('o')).to be_truthy }
    specify { expect(subject.parse('oo')).to be_truthy }
    specify { expect(subject.parse('ooo')).to be_truthy }
  end
end
