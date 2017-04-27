require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "visitor can view color details" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:color)  { FactoryGirl.create(:color, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from the color show page" do
    visit color_path(color)

    expect(page).to have_content color.hex_code
    expect(page).to have_content color.nickname
    expect(page).to have_content "Reviews"
  end

  scenario "by clicking color link on the home page" do
    visit colors_path
    first(:link, color.hex_code).click

    expect(page).to have_content color.hex_code
    expect(page).to have_content color.nickname
    expect(page).to have_content "Reviews"
  end

  scenario "and can get back to index page" do
    visit color_path(color)
    click_link "Home"

    expect(page).to have_content "COLOR_CODER"
  end
end
