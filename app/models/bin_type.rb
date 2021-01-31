class BinType < ApplicationRecord
  include Standardize

  consistentize :address
  has_and_belongs_to_many :collections
end
