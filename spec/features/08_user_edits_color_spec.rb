require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "visitors can edit a color" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:color)  { FactoryGirl.create(:color, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from a link on the color show page if logged in" do
    login_as(user)
    visit root_path

    first(:link, color.hex_code).click
    first(:link, "Edit Color").click

    expect(page).to have_content "Edit Color"
  end

  scenario "and successfully update the database and be redirected to the show page" do
    login_as(user)
    visit root_path

    first(:link, color.hex_code).click
    first(:link, "Edit Color").click

    fill_in "Nickname", with: color.nickname
    click_button "Update Color"

    expect(page).to have_content "Color updated successfully"
    expect(page).to have_content color.nickname
  end

  scenario "only if they are logged in" do
    visit color_path(color)
    expect(page).to_not have_content "Edit Color"

    login_as(user)

    visit color_path(color)
    expect(page).to have_content "Edit Color"
  end
end
