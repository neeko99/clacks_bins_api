class Collection < ApplicationRecord

  scope :bin_type, lambda { |types|
    joins(:bin_types).where(bin_types: { bin_type: types.map(&:strip.downcase) })
  }
  scope :after_pickup_date, ->(date) { where('pickup_date > ? ', date) }
  scope :before_pickup_data, ->(date) { where('pickup_date < ? ', date) }

  has_and_belongs_to_many :bin_types
  belongs_to :collection_group
end


