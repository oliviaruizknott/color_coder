require 'rails_helper'

describe Color do
  subject { described_class.new }
  george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")

  it "is valid with valid attributes" do
    subject.hex_code = "#FFFFFF"
    subject.user = george
    expect(subject).to be_valid
  end

  it "is not valid without a hex color" do
    subject.user = george
    expect(subject).to_not be_valid
  end

  it "is not valid with wrong length" do
    subject.user = george
    subject.hex_code = "Anything"
    expect(subject).to_not be_valid
  end

  it "is valid with nickname" do
    subject.hex_code = "#FFFFFF"
    subject.nickname = "Pale"
    subject.user = george
    expect(subject).to be_valid
    expect(subject.nickname).to eq("Pale")
  end
end
