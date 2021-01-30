class Collection < ApplicationRecord

  scope :bin_type, lambda { |types|
    includes(:bin_types)
      .references(:bin_types)
      .where(bin_types: { bin_type: types.map(&:strip.downcase) })
  }
  scope :postcode, lambda { |postcode|
    joins(:addresses).where(addresses: { postcode: postcode.down_and_out })
  }
  scope :after_pickup_date, ->(date) { where('pickup_date > ? ', date) }
  scope :before_pickup_data, ->(date) { where('pickup_date < ? ', date) }

  has_and_belongs_to_many :bin_types
  belongs_to :collection_group

  has_many :addresses, through: :collection_group

  def self.json_options
    {
      only: [:pickup_date],
      include: {
          bin_types: { only: :bin_type}
      }
    }
  end
end


