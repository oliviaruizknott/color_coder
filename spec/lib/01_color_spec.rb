require 'rails_helper'

RSpec.describe Color, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.hex_code = "FFFFFF"
    expect(subject).to be_valid
  end

  it "is not valid without a hex color" do
    expect(subject).to_not be_valid
  end

  it "is not valid with wrong length" do
    subject.hex_code = "Anything"
    expect(subject).to_not be_valid
  end

  it "is valid with nickname" do
    subject.hex_code = "FFFFFF"
    subject.nickname = "Pale"
    expect(subject).to be_valid
    expect(subject.nickname).to eq("Pale")
  end
end
