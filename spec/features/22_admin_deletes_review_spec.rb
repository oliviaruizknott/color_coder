require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "admin can delete a review" do
  scenario "from the color show page" do
    jane = FactoryGirl.create(:user, first_name: "Jane")
    aquasmoke = Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: jane)
    Review.create(user: jane, color: aquasmoke, rating: 5, body: "This color ROCKS!")
    admin = FactoryGirl.create(:user, role: 'admin')

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button "Log In"

    expect(page).to have_content "#5b756c"
    first(:link, "#5b756c").click

    expect(page).to have_content "This color ROCKS!"
    expect(page).to have_content "Delete Review"

    click_link "Delete Review"

    expect(page).to_not have_content "This color ROCKS!"
  end
end

feature "user cannot delete review" do
  scenario "from the color show page" do
    jane = FactoryGirl.create(:user, first_name: "Jane")
    aquasmoke = Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: jane)
    Review.create(user: jane, color: aquasmoke, rating: 5, body: "This color ROCKS!")

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: jane.email
    fill_in 'Password', with: jane.password
    click_button "Log In"

    expect(page).to have_content "This color ROCKS!"
    first(:link, "#5b756c").click

    expect(page).to have_content "This color ROCKS!"
    expect(page).to_not have_content "Delete Review"
  end
end
