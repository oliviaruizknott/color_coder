require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "visitor can view colors" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:color)  { FactoryGirl.create(:color, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from the root path" do
    visit root_path

    expect(page).to have_content color.hex_code
    expect(page).to have_content color.nickname
  end
end
