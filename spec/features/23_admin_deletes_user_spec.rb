require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "admins can delete user" do
  scenario "from the /users page" do
    FactoryGirl.create(:user, first_name: "Jane")
    FactoryGirl.create(:user, first_name: "Jim")
    FactoryGirl.create(:user, first_name: "James")
    FactoryGirl.create(:user, first_name: "Janet")
    admin = FactoryGirl.create(:user, role: 'admin')
    color = FactoryGirl.create(:color, user: admin)
    FactoryGirl.create(:review, user: admin, color: color)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button "Log In"

    visit users_path

    expect(page).to have_content "Jane Smith"
    expect(page).to have_content "Jim Smith"
    expect(page).to have_content "James Smith"
    expect(page).to have_content "Janet Smith"

    expect(page).to have_content "Delete User"
    first(:link, "Delete User").click
    
    expect(page).to_not have_content "Jane Smith"
  end
end
