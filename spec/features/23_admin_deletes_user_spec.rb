require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "admins can delete user" do
  let!(:jane)   { FactoryGirl.create(:user, first_name: "Jane") }
  let!(:jim)    { FactoryGirl.create(:user, first_name: "Jim") }
  let!(:james)  { FactoryGirl.create(:user, first_name: "James") }
  let!(:janet)  { FactoryGirl.create(:user, first_name: "Janet") }
  let!(:admin)  { FactoryGirl.create(:user, role: 'admin') }
  let!(:color)  { FactoryGirl.create(:color, user: admin) }
  let!(:review) { FactoryGirl.create(:review, user: admin, color: color) }

  scenario "from the /users page" do
    login_as(admin)
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
