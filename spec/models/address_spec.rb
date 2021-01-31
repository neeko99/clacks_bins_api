require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to belong_to :collection_group }

  describe '.despace' do
    context 'when postcode is saved' do
      subject { FactoryBot.build(:address, postcode: 'F K 1 0 3 L L') }
      it { is_expected.to have_attributes(postcode: 'fk103ll')}
    end
  end

  describe '.consistentize' do
    context 'when address is saved' do
      subject { FactoryBot.build(:address, address: ' 81 dEERpARK ') }
      it { is_expected.to have_attributes(address: '81 deerpark')}
    end
  end
end
