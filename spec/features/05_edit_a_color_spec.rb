require "rails_helper"

feature "visitors can edit a color" do
  scenario "from a link on the color show page if logged in" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: george)

    visit root_path
    click_link "Login"

    fill_in 'Email', with: "george53@bu.edu"
    fill_in 'Password', with: "hahacows"
    click_button "Log in"

    click_link "5b756c"
    click_link "Edit Color"

    expect(page).to have_content "Edit Color"
  end

  scenario "and successfully update the database and be redirected to the show page" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: george)

    visit root_path
    click_link "Login"

    fill_in 'Email', with: "george53@bu.edu"
    fill_in 'Password', with: "hahacows"
    click_button "Log in"

    click_link "#5b756c"
    click_link "Edit Color"

    fill_in 'Nickname', with: "Antidisestablishmentarianism"
    click_button "Update Color"

    expect(page).to have_content "Color updated successfully"
    expect(page).to have_content "Antidisestablishmentarianism"
  end

  scenario "only if they are logged in" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    color = Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: george)

    visit color_path(color)
    expect(page).to_not have_content "Edit Color"
  end
end
