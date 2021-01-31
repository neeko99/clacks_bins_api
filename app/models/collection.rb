class Collection < ApplicationRecord

  JSON_OPTIONS = {
    only: [:pickup_date],
    include: {
      bin_types: { only: :bin_type}
    }
  }.freeze

  scope :bin_type, lambda { |types|
    includes(:bin_types)
      .references(:bin_types)
      .where(bin_types: { bin_type: types.map(&:consistentize) })
  }
  scope :postcode, lambda { |postcode|
    joins(:addresses).where(addresses: { postcode: postcode.despacer })
  }
  scope :after_pickup_date, ->(date) { where('pickup_date > ? ', date) }
  scope :before_pickup_date, ->(date) { where('pickup_date < ? ', date) }

  has_and_belongs_to_many :bin_types
  belongs_to :collection_group
  has_many :addresses, through: :collection_group
  

end


