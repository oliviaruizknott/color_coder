require "rails_helper"

feature "visitors can view colors" do
  scenario "from the root path" do
    color = Color.create(hex_code: "5b756c", nickname: "Aqua Smoke")

    visit root_path
    expect(page).to have_content "5b756c"
    expect(page).to have_content "Aqua Smoke"
  end
end
