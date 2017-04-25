require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "visitors can edit a review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:color) { FactoryGirl.create(:color, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from a link on the color show page if logged in" do
    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    click_link color.hex_code
    click_on "Edit Review"
    expect(page).to have_content "Edit Review"
  end

  scenario "and successfully update the database and be redirected to the show page" do
    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    click_link color.hex_code
    click_link "Edit Review"

    select(4, from: "Rating")
    fill_in 'Review', with: "I have a new found respect for this colour"
    click_button "Submit Review"

    expect(page).to have_content "I have a new found respect for this colour"
    expect(page).to have_content "Your review is successfully saved!"
    expect(page).to_not have_content "This just makes me sad."
  end

  scenario "only if they are logged in" do
    visit color_path(color)
    expect(page).to_not have_content "Edit Review"
  end

  scenario "and should be shown error message if updated review has no rating" do
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"
    click_link color.hex_code
    click_link "Edit Review"
    select("", from: "Rating")
    fill_in 'Review', with: "I have a new found respect for this colour"
    click_button "Submit Review"
    expect(page).to have_content "Rating must be between 1 - 5"
    expect(page).to have_content "Edit Review"
    expect(page).to_not have_content "Your review is successfully saved!"
  end

  scenario "and should be shown error message if updated review has no body" do
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"
    click_link color.hex_code
    click_link "Edit Review"
    select(4, from: "Rating")
    fill_in 'Review', with: ""
    click_button "Submit Review"
    expect(page).to have_content "Body can't be blank"
    expect(page).to have_content "Edit Review"
    expect(page).to_not have_content "Your review is successfully saved!"
  end
end
