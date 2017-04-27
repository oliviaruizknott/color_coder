require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "admin can delete a color" do
  let!(:admin)   { FactoryGirl.create(:user, role: "admin") }
  let!(:user)    { FactoryGirl.create(:user) }
  let!(:color)   { FactoryGirl.create(:color, user: user) }
  let!(:color2)  { FactoryGirl.create(:color, hex_code: "#5B7666", user: admin) }
  let!(:review)  { FactoryGirl.create(:review, user: admin, color: color) }

  scenario "from the home page" do
    login_as(admin)
    visit root_path

    expect(page).to have_content color.hex_code
    expect(page).to have_content "Delete Color"

    first(:link, "Delete Color").click

    expect(page).to_not have_content color2.hex_code
  end

  scenario "from the color show page" do
    login_as(admin)
    visit root_path

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
    login_as(user)
    visit root_path

    expect(page).to have_content color.hex_code
    expect(page).to_not have_content "Delete Color"
  end

  scenario "from the color show page" do
    login_as(user)
    visit root_path

    expect(page).to have_content color.hex_code
    first(:link, color.hex_code).click

    expect(page).to_not have_content "Delete Color"
  end
end
