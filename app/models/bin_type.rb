class BinType < ApplicationRecord
  has_and_belongs_to_many :collection_groups
end
