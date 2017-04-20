require 'rails_helper'

feature 'user can post review', %{
  As a user
  I want to add a review to a color
  So I can let people know what I think of it
} do

  scenario "from the color show page" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    color = Color.create(hex_code: "5b756c", nickname: "Aqua Smoke", user: george)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: george.email
    fill_in 'Password', with: george.password
    click_button 'Log In'
    expect(page).to have_content('Welcome Back!')

    click_link color.hex_code

    select(4, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    expect(page).to have_content('Your review is successfully saved!')
  end

  scenario "Rating is not selected and review is not saved" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    color = Color.create(hex_code: "5b756c", nickname: "Aqua Smoke", user: george)

    visit root_path
    click_link color.hex_code
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"

    expect(page).to have_content('Rating must be between 1 - 5')
    expect(page).to_not have_content('Your review is successfully saved!')
  end

  scenario "Review is not provided and review is not saved" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    color = Color.create(hex_code: "5b756c", nickname: "Aqua Smoke", user: george)
    
    visit root_path
    click_link color.hex_code
    select(4, from: "Rating")
    click_button "Submit Review"

    expect(page).to have_content("Body can't be blank")
    expect(page).to_not have_content('Your review is successfully saved!')
  end
end
