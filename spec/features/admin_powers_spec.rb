require "rails_helper"
require_relative "../factories/user_factory"

feature "admins can see a list of users" do
  scenario "from the home page" do
    FactoryGirl.create(:user, first_name: "Jane")
    FactoryGirl.create(:user, first_name: "Jim")
    FactoryGirl.create(:user, first_name: "James")
    FactoryGirl.create(:user, first_name: "Janet")
    admin = FactoryGirl.create(:user, role: 'admin')

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button "Log In"

    expect(page).to have_content "Jane Smith"
    expect(page).to have_content "Jim Smith"
    expect(page).to have_content "James Smith"
    expect(page).to have_content "Janet Smith"
  end
end

feature "users cannot see a list of users" do
  scenario "from the home page" do
    FactoryGirl.create(:user, first_name: "Jane")
    FactoryGirl.create(:user, first_name: "Jim")
    FactoryGirl.create(:user, first_name: "James")
    FactoryGirl.create(:user, first_name: "Janet")
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    expect(page).to_not have_content "Jane Smith"
    expect(page).to_not have_content "Jim Smith"
    expect(page).to_not have_content "James Smith"
    expect(page).to_not have_content "Janet Smith"
  end
end
