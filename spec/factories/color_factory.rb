FactoryGirl.define do
  factory :color do
    sequence(:hex_code) { |n| "#5B766#{n}"}
    nickname 'Aqua Smoke'
    user
  end
end
