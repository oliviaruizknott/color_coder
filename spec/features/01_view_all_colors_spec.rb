require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "visitors can view colors" do
  scenario "from the root path" do
    user = FactoryGirl.create(:user)
    color = FactoryGirl.create(:color, user: user)
    review = FactoryGirl.create(:review, user: user, color: color)

    visit root_path

    expect(page).to have_content color.hex_code
    expect(page).to have_content color.nickname
  end
end
