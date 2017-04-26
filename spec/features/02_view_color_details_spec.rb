require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "visitors can view color details" do
  scenario "from the color show page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    review = FactoryGirl.create(:review, user: user, color: color)

    visit color_path(color)

    expect(page).to have_content color.hex_code
    expect(page).to have_content color.nickname
    expect(page).to have_content "Reviews"
  end

  scenario "by clicking color link on the index page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    review = FactoryGirl.create(:review, user: user, color: color)

    visit colors_path
    click_link color.hex_code

    expect(page).to have_content color.hex_code
    expect(page).to have_content color.nickname
    expect(page).to have_content "Reviews"
  end

  scenario "and can get back to index page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    review = FactoryGirl.create(:review, user: user, color: color)

    visit color_path(color)
    click_link "Home"

    expect(page).to have_content "COLOR_CODER"
  end
end
