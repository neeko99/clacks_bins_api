FactoryBot.define do
  factory :collection do
    association :collection_group
    pickup_date { Time.current + rand.days }
  end
end
