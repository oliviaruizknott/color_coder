require 'rails_helper'

describe Review do
  subject { described_class.new }
  color = Color.new(hex_code: "5b756c", nickname: "Aqua Smoke")

  it "is valid with valid attributes" do
    subject.rating = 3
    subject.body = "This colour is swell."
    subject.color = color
    expect(subject).to be_valid
  end

  it "is not valid without rating and body and color" do
    expect(subject).to_not be_valid
  end

  it "is not valid with wrong rating" do
    subject.rating = 7
    subject.body = "This colour is swell."
    subject.color = color
    expect(subject).to_not be_valid
  end
end
