require 'rails_helper'

feature 'sign up', %{
  As an unauthenticated user
  I want to sign up
  So I can have my own profile
} do

  scenario 'specifying valid and required info' do

    visit new_user_registration_path
    fill_in 'First Name', with: "Jon"
    fill_in 'Last Name', with: "Smith"
    fill_in 'Email', with: 'user@ex.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button "Sign Up"

    expect(page).to have_content("Logged in as")
    expect(page).to have_content("Logout")
  end

  scenario 'required info is not supplied' do
    visit new_user_registration_path
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match confirmation' do
    visit new_user_registration_path
    fill_in 'First Name', with: "Jon"
    fill_in 'Last Name', with: "Smith"
    fill_in 'Email', with: 'user@ex.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'anotherpassword'

    click_button "Sign Up"

    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to_not have_content("Sign Out")
  end
end
