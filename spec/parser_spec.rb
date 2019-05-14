RSpec.describe Mpeg::Parser do
  subject { described_class.new }

  describe "#parse" do
    specify do
      expect(subject.parse('name eq "mo"')).to be_truthy
    end
  end
end
