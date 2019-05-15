RSpec.describe Mpeg::Str do
	context 'he' do
		let(:subject) { described_class.new('he') }

		specify { expect(subject.parse("hello")).to be(false) }
		specify { expect(subject.parse("he")).to be(true) }
	end
end
