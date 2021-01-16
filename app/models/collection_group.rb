class CollectionGroup < ApplicationRecord
  has_many :addresses
  has_many :collections
  has_many :bin_types, -> { distinct }, through: :collections
end
