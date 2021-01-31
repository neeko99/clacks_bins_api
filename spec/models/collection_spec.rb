require 'rails_helper'

RSpec.describe Collection, type: :model do

  let(:red_bin) { FactoryBot.create(:bin_type, bin_type: 'red', ) }
  let(:blue_bin) { FactoryBot.create(:bin_type, bin_type: 'blue') }
  let(:food_caddie) { FactoryBot.create(:bin_type, bin_type: 'Food Caddie') }
  let!(:address) { FactoryBot.create(:address, postcode: 'fk103ll') }

  before do
    FactoryBot.create(:collection, pickup_date: 1.day.from_now, bin_types: [red_bin], collection_group: address.collection_group)
    FactoryBot.create(:collection, pickup_date: 2.days.from_now, bin_types: [blue_bin], collection_group: address.collection_group)
    FactoryBot.create(:collection, pickup_date: 3.day.from_now, bin_types: [red_bin, food_caddie])
  end

  it { is_expected.to have_and_belong_to_many :bin_types }
  it { is_expected.to belong_to :collection_group }
  it { is_expected.to have_many :addresses }

  describe '.bin_type' do
    context 'when searching red' do
      it 'returns only red bins' do
        expect(described_class.bin_type(['red']).count).to eq(2)
      end

      it 'returns red regardless of case' do
        expect(described_class.bin_type(['REd']).count).to eq(2)
      end

      it 'returns red regardless of trailing spaces' do
        expect(described_class.bin_type([' red ']).count).to eq(2)
      end

      it 'returns empty when no match' do
        expect(described_class.bin_type(['BBC']).count).to eq(0)
      end
    end
  end

  describe '.postcode' do
    context 'when searching postcode' do
      it 'returns only associated records' do
        expect(described_class.postcode('fk103ll').count).to eq(2)
      end

      it 'returns records regardless of case' do
        expect(described_class.postcode('FK103LL').count).to eq(2)
      end

      it 'returns red regardless of any spaces' do
        expect(described_class.postcode('F K 10 3LL ').count).to eq(2)
      end

      it 'returns empty when no match' do
        expect(described_class.postcode('BBC').count).to eq(0)
      end
    end
  end

  describe '.postcode' do
    context 'when searching postcode' do
      it 'returns only associated records' do
        expect(described_class.postcode('fk103ll').count).to eq(2)
      end

      it 'returns records regardless of case' do
        expect(described_class.postcode('FK103LL').count).to eq(2)
      end

      it 'returns red regardless of any spaces' do
        expect(described_class.postcode('F K 10 3LL ').count).to eq(2)
      end

      it 'returns empty when no match' do
        expect(described_class.postcode('BBC').count).to eq(0)
      end
    end
  end

  describe '.after_pickup_date' do
    context 'when searching after date' do
      it 'returns only later records' do
        expect(described_class.after_pickup_date(2.days.from_now).count).to eq(1)
      end

      it 'returns empty no newer records' do
        expect(described_class.after_pickup_date(3.days.from_now).count).to eq(0)
      end
    end
  end

  describe '.before_pickup_date' do
    context 'when searching before date' do
      it 'returns only earlier records' do
        expect(described_class.before_pickup_date(2.days.from_now).count).to eq(1)
      end

      it 'returns empty no newer records' do
        expect(described_class.before_pickup_date(Time.now).count).to eq(0)
      end
    end
  end
end