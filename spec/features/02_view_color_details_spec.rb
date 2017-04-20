require "rails_helper"

feature "visitors can view color details" do
  scenario "from the color show page" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    color = Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: george)

    visit color_path(color)
    expect(page).to have_content "#5b756c"
    expect(page).to have_content "Aqua Smoke"
    expect(page).to have_content "Reviews"
  end

  scenario "by clicking color link on the index page" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: george)

    visit colors_path
    click_link "#5b756c"

    expect(page).to have_content "#5b756c"
    expect(page).to have_content "Aqua Smoke"
    expect(page).to have_content "Reviews"
  end

  scenario "and can get back to index page" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    color = Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: george)

    visit color_path(color)
    click_link "Home"

    expect(page).to have_content "COLORS"
  end
end
