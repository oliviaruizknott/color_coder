require 'rails_helper'

feature 'user signs out', %{
  As an authenticated user
  I want to sign out
  So no one can change my facebook status
} do

  scenario 'a logged in user successfully logs out' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    click_link 'Logout'

    expect(page).to have_content('Signed out successfully.')
    expect(page).to_not have_content('Logged in as')
  end
end
