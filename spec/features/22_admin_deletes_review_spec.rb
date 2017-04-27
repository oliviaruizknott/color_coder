require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "admin can delete a review" do
  let!(:user)    { FactoryGirl.create(:user) }
  let!(:color)   { FactoryGirl.create(:color, user: user) }
  let!(:review)  { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from the color show page" do
    admin = FactoryGirl.create(:user, role: "admin")

    visit root_path
    click_link "Sign In"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    first(:link, color.hex_code).click

    expect(page).to have_content review.body
    expect(page).to have_content "Delete Review"

    click_link "Delete Review"

    expect(page).to_not have_content review.body
  end
end

feature "user cannot delete review" do
  let!(:user)    { FactoryGirl.create(:user) }
  let!(:color)   { FactoryGirl.create(:color, user: user) }
  let!(:review)  { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from the color show page" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    expect(page).to have_content review.body
    first(:link, color.hex_code).click

    expect(page).to have_content review.body
    expect(page).to_not have_content "Delete Review"
  end
end
