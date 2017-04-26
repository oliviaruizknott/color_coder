require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "visitors can edit a color" do
  scenario "from a link on the color show page if logged in" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    review = FactoryGirl.create(:review, user: user, color: color)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    first(:link, color.hex_code).click
    click_link "Edit Color"

    expect(page).to have_content "Edit Color"
  end

  scenario "and successfully update the database and be redirected to the show page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    review = FactoryGirl.create(:review, user: user, color: color)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    first(:link, color.hex_code).click
    click_link "Edit Color"

    fill_in 'Nickname', with: color.nickname
    click_button "Update Color"

    expect(page).to have_content "Color updated successfully"
    expect(page).to have_content color.nickname
  end

  scenario "only if they are logged in" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    review = FactoryGirl.create(:review, user: user, color: color)

    visit color_path(color)
    expect(page).to_not have_content "Edit Color"

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    visit color_path(color)

    expect(page).to have_content "Edit Color"
  end
end
