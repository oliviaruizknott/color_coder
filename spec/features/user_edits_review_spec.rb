require "rails_helper"
require_relative "../factories/user_factory"

feature "visitors can edit a review" do
  scenario "from a link on the color show page if logged in" do
    user = FactoryGirl.create(:user)
    color = Color.create(hex_code: "#5b766c", nickname: "equa Smoke", user_id: user.id)
    Review.create(rating: 2, body: "This just makes me sad.", color: color, user_id: user.id)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    click_link "#5b766c"
    click_link "Edit Review"
    expect(page).to have_content "Edit Review"
  end

  scenario "and successfully update the database and be redirected to the show page" do
    user = FactoryGirl.create(:user)
    color = Color.create(hex_code: "#5b756c", nickname: "1", user: user)
    Review.create(rating: 2, body: "This just makes me sad.", color: color, user: user)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    click_link "#5b756c"
    click_link "Edit Review"

    select(4, from: "Rating")
    fill_in 'Review', with: "I have a new found respect for this colour"
    click_button "Submit Review"

    expect(page).to have_content "I have a new found respect for this colour"
    expect(page).to have_content "Your review is successfully saved!"
    expect(page).to_not have_content "This just makes me sad."
  end

  scenario "only if they are logged in" do
    user = FactoryGirl.create(:user)
    color = Color.create(hex_code: "#5b756c", nickname: "2", user: user)

    visit color_path(color)
    expect(page).to_not have_content "Edit Review"
  end
end
