require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "user can post review" do
  let!(:user)  { FactoryGirl.create(:user) }
  let!(:color) { FactoryGirl.create(:color, user: user) }

  scenario "from the color show page" do
    login_as(user)
    visit root_path

    expect(page).to have_content(color.hex_code)

    first(:link, color.hex_code).click

    select(4, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    expect(page).to have_content("Your review is successfully saved!")
  end

  scenario "Rating is not selected and review is not saved" do
    login_as(user)
    visit root_path

    expect(page).to have_content(color.hex_code)

    first(:link, color.hex_code).click
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"

    expect(page).to have_content("Rating must be between 1 - 5")
    expect(page).to_not have_content("Your review is successfully saved!")
  end

  scenario "Review is not provided and review is not saved" do
    login_as(user)
    visit root_path

    expect(page).to have_content(color.hex_code)

    first(:link, color.hex_code).click
    select(4, from: "Rating")
    click_button "Submit Review"

    expect(page).to have_content("Body can't be blank")
    expect(page).to_not have_content("Your review is successfully saved!")
  end
end
