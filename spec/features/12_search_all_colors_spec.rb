require "rails_helper"
require_relative "../factories/user_factory"
require_relative "../factories/color_factory"

feature "visitors can search for a color" do
  let(:user)    { FactoryGirl.create(:user) }
  let!(:color)  { FactoryGirl.create(:color, user: user) }
  let!(:color2) { FactoryGirl.create(:color, hex_code: '#5B7666', user: user) }

  scenario "from the index page" do
    visit root_path

    fill_in "Hex-Code", with: color.hex_code
    click_button "Search"

    expect(page).to have_content color.hex_code
  end

  scenario "and see the results" do
    visit root_path
    fill_in "Hex-Code", with: color.hex_code
    click_button "Search"

    expect(page).to have_content color.hex_code
  end
end
