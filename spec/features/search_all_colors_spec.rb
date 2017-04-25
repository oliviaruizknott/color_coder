require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"

feature "visitors can search for a color" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:color1) {FactoryGirl.create(:color, user: user)}
  let!(:color2) {FactoryGirl.create(:color, user: user)}

  scenario "from the index page" do
    visit root_path
    fill_in "Hex-Code", with: color1.hex_code
    click_button "Search"

    expect(page).to have_content color1.hex_code
    expect(page).to_not have_content color2.hex_code
  end

  scenario "and see the results" do
    visit root_path
    fill_in "Hex-Code", with: color1.hex_code
    click_button "Search"

    expect(page).to have_content color1.hex_code
    expect(page).to_not have_content color2.hex_code
  end
end
