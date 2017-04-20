require 'rails_helper'

feature 'user signs in', %Q{
  As a user
  I want to sign in
  So that I can see my colors and reviews
} do

  FactoryGirl.define do
    factory :user do
      sequence(:email) {|n| "person#{n}@example.com"}
      first_name 'John'
      last_name 'Smith'
      password 'password'
      password_confirmation 'password'
    end
  end

  scenario 'an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Logout')
  end

  scenario 'a nonexistent email and password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'nobody@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'

    expect(page).to have_content('Invalid Email or password.')
    expect(page).to_not have_content('Welcome Back!')
    expect(page).to_not have_content('Logout')
  end

  scenario 'an existing email with the wrong password is denied access' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'anotherpassword'
    click_button 'Log In'

    expect(page).to have_content('Invalid Email or password.')
    expect(page).to_not have_content('Logout')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    expect(page).to have_content('Logout')
    expect(page).to_not have_content('Sign In')

    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
  end
end
