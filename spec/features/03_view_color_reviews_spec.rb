require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"
require_relative "../factories/review_factory"

feature "visitors can view color reviews" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:color)  { FactoryGirl.create(:color, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from the color show page" do
    visit color_path(color)
    expect(page).to have_content color.hex_code
    expect(page).to have_content color.nickname
    expect(page).to have_content review.created_at.strftime("%B %d, %Y")
    expect(page).to have_content(review.body)
  end
end
