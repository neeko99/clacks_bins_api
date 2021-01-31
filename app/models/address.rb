class Address < ApplicationRecord
  include Standardize

  despace :postcode
  consistentize :address

  belongs_to :collection_group
end
