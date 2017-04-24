require "rails_helper"
require_relative "../factories/user_factory"

feature "visitors can delete a review" do
  scenario "from a button on the review edit page if logged in" do
    user = FactoryGirl.create(:user)
    color = Color.create(hex_code: "#5b766c", nickname: "equa Smoke", user: user)
    Review.create(rating: 2, body: "This just makes me sad.", color: color, user: user)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    click_link "#5b766c"
    click_link "Edit Review"
    click_link "Delete Review"

    expect(page).to have_content "#5b766c"
    expect(page).to_not have_content "This just makes me sad."
  end
end
