require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.first_name = "George"
    subject.last_name = "Li"
    subject.email = "email@email.com"
    subject.password = "hahacows"
    expect(subject).to be_valid
  end

  it "is not valid without a first name" do
    subject.last_name = "Li"
    subject.email = "email@email.com"
    subject.password = "hahacows"
    expect(subject).to_not be_valid
  end

  it "is not valid without a last name" do
    subject.first_name = "George"
    subject.email = "email@email.com"
    subject.password = "hahacows"
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.first_name = "George"
    subject.last_name = "Li"
    subject.password = "hahacows"
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.first_name = "George"
    subject.last_name = "Li"
    subject.email = "email@email.com"
    expect(subject).to_not be_valid
  end

  describe "#admin?" do
    subject { described_class.new }

    it "is not an admin if the role is not admin" do
      subject.first_name = "George"
      subject.last_name = "Li"
      subject.email = "email@email.com"
      subject.password = "hahacows"
      subject.role = "member"
      expect(subject.admin?).to eq(false)
    end

    it "is an admin if the role is admin" do
      subject.first_name = "George"
      subject.last_name = "Li"
      subject.email = "email@email.com"
      subject.password = "hahacows"
      subject.role = "admin"
      expect(subject.admin?).to eq(true)
    end
  end
end
