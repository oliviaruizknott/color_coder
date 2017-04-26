require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "admins can see a list of users" do
  scenario "from a link on the home page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    FactoryGirl.create(:review, user: user, color: color)
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

    click_link "See All Users"

    expect(page).to have_content "Jane Smith"
    expect(page).to have_content "Jim Smith"
    expect(page).to have_content "James Smith"
    expect(page).to have_content "Janet Smith"
  end

  scenario "by navigating to the /users page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    FactoryGirl.create(:review, user: user, color: color)
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

    visit users_path

    expect(page).to have_content "Jane Smith"
    expect(page).to have_content "Jim Smith"
    expect(page).to have_content "James Smith"
    expect(page).to have_content "Janet Smith"
  end
end

feature "users cannot see a list of users" do
  scenario "via a link on the home page" do
    FactoryGirl.create(:user, first_name: "Jane")
    FactoryGirl.create(:user, first_name: "Jim")
    FactoryGirl.create(:user, first_name: "James")
    FactoryGirl.create(:user, first_name: "Janet")
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    FactoryGirl.create(:review, user: user, color: color)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    expect(page).to_not have_content "See All Users"
  end

  scenario "by navigating to the /users page" do
    FactoryGirl.create(:user, first_name: "Jane")
    FactoryGirl.create(:user, first_name: "Jim")
    FactoryGirl.create(:user, first_name: "James")
    FactoryGirl.create(:user, first_name: "Janet")
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    FactoryGirl.create(:review, user: user, color: color)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    expect { visit users_path }.to raise_error( ActionController::RoutingError )
  end
end
