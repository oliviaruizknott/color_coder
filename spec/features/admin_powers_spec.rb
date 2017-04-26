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

    expect { visit users_path }.to raise_error
  end
end

feature "admin can delete a color" do
  scenario "from the home page" do
    admin = FactoryGirl.create(:user, first_name: "Mark", role: 'admin')
    color = FactoryGirl.create(:color, hex_code: "#111222", user: admin)
    color2 = FactoryGirl.create(:color, hex_code: "#111223", user: admin)
    review = FactoryGirl.create(:review, user: admin, color: color2)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    expect(page).to have_content "Delete Color"

    first(:link, "Delete Color").click

    expect(page).to_not have_content color.hex_code
  end

  scenario "from the color show page" do
    admin = FactoryGirl.create(:user, first_name: "Mark", role: 'admin')
    color = FactoryGirl.create(:color, hex_code: "#333444", user: admin)
    color2 = FactoryGirl.create(:color, hex_code: "#333445", user: admin)
    review = FactoryGirl.create(:review, user: admin, color: color2)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    first(:link, color.hex_code).click

    expect(page).to have_content "Delete Color"

    click_link "Delete Color"

    expect(page).to_not have_content color.hex_code
  end
end

feature "user cannot delete color" do
  scenario "from the home page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    expect(page).to_not have_content "Delete Color"
  end

  scenario "from the color show page" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    expect(page).to have_content color.hex_code
    first(:link, color.hex_code).click

    expect(page).to_not have_content "Delete Color"
  end
end

feature "admin can delete a review" do
  scenario "from the color show page" do
    jane = FactoryGirl.create(:user, first_name: "Jane")
    aquasmoke = Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: jane)
    Review.create(user: jane, color: aquasmoke, rating: 5, body: "This color ROCKS!")
    admin = FactoryGirl.create(:user, role: 'admin')

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button "Log In"

    expect(page).to have_content "#5b756c"
    first(:link, "#5b756c").click

    expect(page).to have_content "This color ROCKS!"
    expect(page).to have_content "Delete Review"

    click_link "Delete Review"

    expect(page).to_not have_content "This color ROCKS!"
  end
end

feature "user cannot delete color" do
  scenario "from the color show page" do
    jane = FactoryGirl.create(:user, first_name: "Jane")
    aquasmoke = Color.create(hex_code: "#5b756c", nickname: "Aqua Smoke", user: jane)
    Review.create(user: jane, color: aquasmoke, rating: 5, body: "This color ROCKS!")

    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: jane.email
    fill_in 'Password', with: jane.password
    click_button "Log In"

    expect(page).to have_content "#5b756c"
    first(:link, "#5b756c").click

    expect(page).to have_content "This color ROCKS!"
    expect(page).to_not have_content "Delete Review"
  end
end
