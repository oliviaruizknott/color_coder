require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "admin can delete a color" do
  scenario "from the home page" do
    admin = FactoryGirl.create(:user, first_name: "Mark", role: 'admin')
    color = FactoryGirl.create(:color, hex_code: "#111222", user: admin)
    color2 = FactoryGirl.create(:color, hex_code: "#111223", user: admin)
    review = FactoryGirl.create(:review, user: admin, color: color2)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    expect(page).to have_content "Delete Color"

    first(:link, "Delete Color").click

    expect(page).to_not have_content color.hex_code
  end

  scenario "from the color show page" do
    admin = FactoryGirl.create(:user, first_name: "Mark", role: 'admin')
    color = FactoryGirl.create(:color, hex_code: "#333444", user: admin)
    color2 = FactoryGirl.create(:color, hex_code: "#333445", user: admin)
    review = FactoryGirl.create(:review, user: admin, color: color2)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    first(:link, color.hex_code).click

    expect(page).to have_content "Delete Color"

    click_link "Delete Color"

    expect(page).to_not have_content color.hex_code
  end
end

feature "user cannot delete color" do
  scenario "from the home page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    expect(page).to_not have_content "Delete Color"
  end

  scenario "from the color show page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    first(:link, color.hex_code).click

    expect(page).to_not have_content "Delete Color"
  end
end
