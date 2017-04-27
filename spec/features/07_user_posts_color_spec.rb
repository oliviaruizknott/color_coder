require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "Users can add a new color" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:color)  { FactoryGirl.create(:color, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from a link on the root path if they are logged in" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    click_link "+"
    expect(page).to have_content "New Color"
  end

  scenario "and can get back to the Index page" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    click_link "+"
    fill_in "Hex Code", with: "#123456"
    fill_in "Nickname", with: "random"
    click_button "Add Color"
    expect(page).to have_content "#123456"
  end

  scenario "successfully with nickname" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    click_link "+"

    expect(page).to have_content "New Color"
    fill_in "Hex Code", with: "#FFFFFF"
    fill_in "Nickname", with: "Black"
    click_button "Add Color"
    expect(page).to have_content "Color added successfully"
    expect(page).to have_content "#FFFFFF"
    expect(page).to have_content "Black"
  end

  scenario "successfully without nickname" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    click_link "+"

    expect(page).to have_content "New Color"
    fill_in "Hex Code", with: "#FFFFFF"
    click_button "Add Color"
    expect(page).to have_content "Color added successfully"
    expect(page).to have_content "#FFFFFF"
  end

  scenario "but are not able to enter a color already in the database" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    click_link "+"

    expect(page).to have_content "New Color"
    fill_in "Hex Code", with: color.hex_code
    click_button "Add Color"
    expect(page).to have_content "Hex code has already been taken"
  end

  scenario "but are not able to leave the hex code blank" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    click_link "+"

    expect(page).to have_content "New Color"
    click_button "Add Color"
    expect(page).to have_content "Hex code can't be blank"
  end

  scenario "only if they are logged in" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    expect(page).to have_content "+"
    expect(page).to_not have_content "COLOR_CODERS"
  end
end
