require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to belong_to :collection_group }
end