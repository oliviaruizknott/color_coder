# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

george = User.create!(first_name: "George", last_name: "Li", email: "george53@bu.edu", password: "hahacows")

Color.create!(hex_code: "5b756c", nickname: "Aqua Smoke", user: george)
Color.create!(hex_code: "CCAC95", nickname: "Pale", user: george)
Color.create!(hex_code: "9D7E79", nickname: "distance between", user: george)

color = Color.first
Review.create!(rating: 2, body: "Boo, this colour is too drab for my standards", color: color, user: george)
Review.create!(rating: 5, body: "I would paint my whole house this colour, I dream in this Hex!!!", color: color, user: george)
Review.create!(rating: 3, body: "Wonderful, soft smokey blue. A bit too light, but makes a serious punch on screen. I designed my logo with it.", color: color, user: george)

color = Color.second
Review.create!(rating: 1, body: "YUCK!!!!!", color: color, user: george)
Review.create!(rating: 5, body: "YAAAAAAS! This color is so chill.", color: color, user: george)
Review.create!(rating: 3, body: "Dope, but not the best.", color: color, user: george)

color = Color.third
Review.create!(rating: 2, body: "This just makes me sad.", color: color, user: george)
Review.create!(rating: 3, body: "It’s okay, but I won’t use it too much.", color: color, user: george)
Review.create!(rating: 4, body: "Niiiiice. Used it for a great logo color.", color: color, user: george)
