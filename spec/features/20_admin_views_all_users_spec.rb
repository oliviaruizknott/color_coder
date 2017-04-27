require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "admins can see a list of users" do
  let!(:admin)  { FactoryGirl.create(:user, role: "admin") }
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:jane)   { FactoryGirl.create(:user, first_name: "Jane") }
  let!(:jim)    { FactoryGirl.create(:user, first_name: "Jim") }
  let!(:james)  { FactoryGirl.create(:user, first_name: "James") }
  let!(:janet)  { FactoryGirl.create(:user, first_name: "Janet") }

  let!(:color)  { FactoryGirl.create(:color, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from a link on the home page" do
    login_as(admin)
    visit root_path

    click_link "See All Users"

    expect(page).to have_content "Jane Smith"
    expect(page).to have_content "Jim Smith"
    expect(page).to have_content "James Smith"
    expect(page).to have_content "Janet Smith"
  end

  scenario "by navigating to the /users page" do
    login_as(admin)
    visit users_path

    expect(page).to have_content "Jane Smith"
    expect(page).to have_content "Jim Smith"
    expect(page).to have_content "James Smith"
    expect(page).to have_content "Janet Smith"
  end
end

feature "users cannot see a list of users" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:jane)   { FactoryGirl.create(:user, first_name: "Jane") }
  let!(:jim)    { FactoryGirl.create(:user, first_name: "Jim") }
  let!(:james)  { FactoryGirl.create(:user, first_name: "James") }
  let!(:janet)  { FactoryGirl.create(:user, first_name: "Janet") }

  let!(:color)  { FactoryGirl.create(:color, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, color: color) }

  scenario "via a link on the home page" do
    login_as(user)
    visit root_path

    expect(page).to_not have_content "See All Users"
  end

  scenario "by navigating to the /users page" do
    login_as(user)

    expect { visit users_path }.to raise_error( ActionController::RoutingError )
  end
end
