FactoryGirl.define do
  factory :review do
    rating 2
    body 'This just makes me sad.'
    color
    user
  end
end
