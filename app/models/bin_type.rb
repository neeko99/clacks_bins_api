class BinType < ApplicationRecord
  include Standardize

  consistentize :bin_type
  has_and_belongs_to_many :collections
end
