require 'rails_helper'

# feature 'view most recently reviewed colors', %{
#   As a user
#   I want to see the five most recently reviewed colors
#   So I know which colors are frequently debated
# } do
#
#   scenario 'from the root path' do
#     george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
#
#     Color.create(hex_code: "#2f0185", nickname: "lavender", user: george)
#     Color.create(hex_code: "#8d3152", nickname: "red", user: george)
#     Color.create(hex_code: "#c4dc8f", nickname: "sky blue", user: george)
#     Color.create(hex_code: "#b29e98", nickname: "silver", user: george)
#     Color.create(hex_code: "#539d71", nickname: "red", user: george)
#     Color.create(hex_code: "#ee9e44", nickname: "white", user: george)
#     Color.create(hex_code: "#33f91a", nickname: "teal", user: george)
#     Color.create(hex_code: "#809dea", nickname: "salmon", user: george)
#     Color.create(hex_code: "#15e61a", nickname: "grey", user: george)
#     Color.create(hex_code: "#1a9f6d", nickname: "gold", user: george)
#     Color.create(hex_code: "#c56928", nickname: "tan", user: george)
#
#     Review.create(rating: 3, body: "WOW. This is a great color. So coool.", user: george, color_id: 1)
#     Review.create(rating: 3, body: "a.", user: george, color_id: 1)
#     Review.create(rating: 3, body: "asdfsa.", user: george, color_id: 7)
#     Review.create(rating: 3, body: "awgw", user: george, color_id: 8)
#     Review.create(rating: 3, body: "cvbzxcvbxcv.", user: george, color_id: 9)
#     Review.create(rating: 3, body: "waert", user: george, color_id: 10)
#     Review.create(rating: 3, body: "234gasfd", user: george, color_id: 11)
#
#     visit root_path
#
#     expect(page).to have_content("#c56928")
#     expect(page).to have_content("#1a9f6d")
#     expect(page).to have_content("#15e61a")
#     expect(page).to have_content("#809dea")
#     expect(page).to have_content("#33f91a")
#
#     a = Review.create(rating: 3, body: "WOW. This is a great color. So coool.", user: george, color_id: 2)
#     b = Review.create(rating: 3, body: "WOW. This is a great color. So coool.", user: george, color_id: 5)
#     c = Review.create(rating: 3, body: "WOW. This is a great color. So coool.", user: george, color_id: 6)
#     d = Review.create(rating: 3, body: "WOW. This is a great color. So coool.", user: george, color_id: 4)
#     e = Review.create(rating: 3, body: "WOW. This is a great color. So coool.", user: george, color_id: 3)
#
#     visit root_path
#
#     expect(page).to have_content(a.created_at)
#     expect(page).to have_content(b.created_at)
#     expect(page).to have_content(c.created_at)
#     expect(page).to have_content(d.created_at)
#     expect(page).to have_content(e.created_at)
#   end
#
#   scenario 'clicking on review hexcode should bring user to color show page' do
#     george = User.create(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")
#
#     Color.create(hex_code: "#2f0185", nickname: "lavender", user: george)
#     Color.create(hex_code: "#8d3152", nickname: "red", user: george)
#     Color.create(hex_code: "#c4dc8f", nickname: "sky blue", user: george)
#     Color.create(hex_code: "#b29e98", nickname: "silver", user: george)
#     Color.create(hex_code: "#539d71", nickname: "red", user: george)
#     Color.create(hex_code: "#ee9e44", nickname: "white", user: george)
#     Color.create(hex_code: "#33f91a", nickname: "teal", user: george)
#     Color.create(hex_code: "#809dea", nickname: "salmon", user: george)
#     Color.create(hex_code: "#15e61a", nickname: "grey", user: george)
#     Color.create(hex_code: "#1a9f6d", nickname: "gold", user: george)
#     Color.create(hex_code: "#c56928", nickname: "tan", user: george)
#
#     Review.create(rating: 3, body: "WOW. This is a great color. So coool.", user: george, color_id: 1)
#     Review.create(rating: 3, body: "a.", user: george, color_id: 1)
#     Review.create(rating: 3, body: "asdfsa.", user: george, color_id: 7)
#     Review.create(rating: 3, body: "awgw", user: george, color_id: 8)
#     Review.create(rating: 3, body: "cvbzxcvbxcv.", user: george, color_id: 9)
#     Review.create(rating: 3, body: "waert", user: george, color_id: 10)
#     Review.create(rating: 3, body: "234gasfd", user: george, color_id: 11)
#
#     visit root_path
#
#     first(:link, 'Color Page')
#
#     expect(page).to have_content("#c56928")
#
#   end
# end
