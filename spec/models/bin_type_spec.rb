require 'rails_helper'

RSpec.describe BinType, type: :model do
  it { is_expected.to have_and_belong_to_many :collections }

  describe '.consistentize' do
    context 'when bin_type is saved' do
      subject { FactoryBot.build(:bin_type, bin_type: ' Silly Bin') }
      it { is_expected.to have_attributes(bin_type: 'silly bin')}
    end
  end
end
