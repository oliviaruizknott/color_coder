require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "visitors can delete their own review" do
  let!(:user)    { FactoryGirl.create(:user) }
  let!(:color)   { FactoryGirl.create(:color, user: user) }
  let!(:review)  { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from a button on the review edit page if logged in" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    first(:link, color.hex_code).click
    click_link "Edit Review"
    click_link "Delete Review"

    expect(page).to have_content color.hex_code
    expect(page).to_not have_content review.body
  end
end
