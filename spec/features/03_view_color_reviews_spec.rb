require "rails_helper"

feature "visitors can view color reviews" do
  scenario "from the color show page" do
    george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
    color = Color.create(hex_code: "5b756c", nickname: "Aqua Smoke", user: george)
    review = Review.create!(rating: 5, body: "I would paint my whole house this colour, I dream in this Hex!!!", color: color, user: george)

    visit color_path(color)
    expect(page).to have_content "5b756c"
    expect(page).to have_content "Aqua Smoke"
    expect(page).to have_content review.created_at.strftime("%B %d, %Y")
    expect(page).to have_content(review.body)
  end
end
