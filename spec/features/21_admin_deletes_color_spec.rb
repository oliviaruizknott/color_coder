require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "admin can delete a color" do
  let!(:admin)  { FactoryGirl.create(:user, first_name: "Mark", role: "admin") }
  let!(:color)  { FactoryGirl.create(:color, user: admin) }
  let!(:color2) { FactoryGirl.create(:color, hex_code: "#5B7666", user: admin) }
  let!(:review) { FactoryGirl.create(:review, user: admin, color: color2) }

  scenario "from the home page" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    expect(page).to have_content "Delete Color"

    first(:link, "Delete Color").click

    expect(page).to_not have_content color.hex_code
  end

  scenario "from the color show page" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    first(:link, color.hex_code).click

    expect(page).to have_content "Delete Color"

    click_link "Delete Color"

    expect(page).to_not have_content color.hex_code
  end
end

feature "user cannot delete color" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:color)  { FactoryGirl.create(:color, user: user) }

  scenario "from the home page" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    expect(page).to_not have_content "Delete Color"
  end

  scenario "from the color show page" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    first(:link, color.hex_code).click

    expect(page).to_not have_content "Delete Color"
  end
end
