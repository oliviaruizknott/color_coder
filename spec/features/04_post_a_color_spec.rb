require "rails_helper"

feature "visitors can add a new color" do
  scenario "from a link on the root path if they are logged in" do
    User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")

    visit root_path
    click_link "Login"

    fill_in 'Email', with: "george53@bu.edu"
    fill_in 'Password', with: "hahacows"
    click_button "Log in"

    click_link "Add a new color"
    expect(page).to have_content "New Color"
  end

  scenario "and can get back to the Index page" do
    visit new_color_path
    click_link "Home"
    expect(page).to have_content "COLORS"
  end

  scenario "successfully with nickname" do
    User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")

    visit root_path
    click_link "Login"

    fill_in 'Email', with: "george53@bu.edu"
    fill_in 'Password', with: "hahacows"
    click_button "Log in"

    click_link "Add a new color"

    expect(page).to have_content "New Color"
    fill_in 'Hex Code', with: "FFFFFF"
    fill_in 'Nickname', with: "Black"
    click_button "Add Color"
    expect(page).to have_content "Color added successfully"
    expect(page).to have_content "FFFFFF"
    expect(page).to have_content "Black"
  end

  scenario "successfully without nickname" do
    User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")

    visit root_path
    click_link "Login"

    fill_in 'Email', with: "george53@bu.edu"
    fill_in 'Password', with: "hahacows"
    click_button "Log in"

    click_link "Add a new color"

    expect(page).to have_content "New Color"
    fill_in 'Hex Code', with: "FFFFFF"
    click_button "Add Color"
    expect(page).to have_content "Color added successfully"
    expect(page).to have_content "FFFFFF"
  end

  scenario "but are not able to enter a color already in the database" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    Color.create(hex_code: "5b756c", nickname: "Aqua Smoke", user: george)

    visit root_path
    click_link "Login"

    fill_in 'Email', with: "george53@bu.edu"
    fill_in 'Password', with: "hahacows"
    click_button "Log in"

    click_link "Add a new color"

    expect(page).to have_content "New Color"
    fill_in 'Hex Code', with: "5b756c"
    click_button "Add Color"
    expect(page).to have_content "Hex code has already been taken"
  end

  scenario "but are not able to leave the hex code blank" do
    User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")

    visit root_path
    click_link "Login"

    fill_in 'Email', with: "george53@bu.edu"
    fill_in 'Password', with: "hahacows"
    click_button "Log in"

    click_link "Add a new color"

    expect(page).to have_content "New Color"
    click_button "Add Color"
    expect(page).to have_content "Hex code can't be blank"
  end

  scenario "only if they are logged in" do
    visit root_path
    expect(page).to_not have_content "Add a new color"
  end
end

# george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
#
# Color.create(hex_code: "5b756c", nickname: "Aqua Smoke", user: george)
