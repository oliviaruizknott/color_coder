require 'rails_helper'

describe Review do
  subject { described_class.new }
  george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
  color = Color.new(hex_code: "5b756c", nickname: "Aqua Smoke", user: george)

  it "is valid with valid attributes" do
    subject.rating = 3
    subject.body = "This colour is swell."
    subject.color = color
    subject.user = george
    expect(subject).to be_valid
  end

  it "is not valid without rating and body and color" do
    subject.user = george
    expect(subject).to_not be_valid
  end

  it "is not valid with wrong rating" do
    subject.rating = 7
    subject.body = "This colour is swell."
    subject.user = george
    subject.color = color
    expect(subject).to_not be_valid
  end
end
