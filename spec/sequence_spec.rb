RSpec.describe Mpeg::Sequence do
  subject { Mpeg::Str.new('h') >> Mpeg::Str.new('i') }

  context "when the sequence does match" do
    let(:input) { Mpeg::Input.new('hi')  }
    let!(:result) { subject.parse('hi', input: input) }

    specify { expect(result).to be_truthy }
    specify { expect(input).to be_end_of_string }
  end

  context "when the sequence does not match" do
    let(:input) { Mpeg::Input.new('hello')  }
    let!(:result) { subject.parse('hello', input: input) }

    specify { expect(result).to be_falsey }
    specify { expect(input.position).to be_zero }
  end
end
