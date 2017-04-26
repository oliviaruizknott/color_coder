FactoryGirl.define do
  factory :color do
    sequence(:hex_code) { "#5B7665" }
    nickname 'Aqua Smoke'
    user
  end

  def self.reload
    self.factories.clear
  end

end
