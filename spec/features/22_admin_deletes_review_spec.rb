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
    login_as(admin)
    visit root_path

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
    login_as(user)
    visit root_path

    first(:link, color.hex_code).click

    expect(page).to have_content review.body
    expect(page).to_not have_content "Delete Review"
  end
end
