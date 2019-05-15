RSpec.describe Mpeg::Alternative do
  context "jello | hello" do
    subject { Mpeg::Str.new('jello') | Mpeg::Str.new('hello') }

    specify { expect(subject.parse("hello")).to be_truthy }
  end

  context "hello | jello" do
    subject { Mpeg::Str.new('hello') | Mpeg::Str.new('jello') }

    specify { expect(subject.parse("hello")).to be_truthy }
  end

  context "fellow | jello" do
    subject { Mpeg::Str.new('fellow') | Mpeg::Str.new('jello') }

    specify { expect(subject.parse("hello")).to be_falsey }
  end
end
