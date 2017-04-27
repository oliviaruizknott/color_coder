## Some Faker text for entering new records manually in pry:
# User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password)
# Color.create!(hex_code: Faker::Color.hex_color, nickname: Faker::Color.color_name, user: User.find(rand(1..User.count)))
# Review.create!(rating: rand(1..5), body: Faker::Hipster.paragraph(2), color: Color.find(rand(1..Color.count)), user: User.find(rand(1..User.count)))


admin = User.create!(first_name: "George", last_name: "Smith", email: "george@email.com", password: "hahacows", role: "admin")
john = User.create!(first_name: "John", last_name: "Smyth", email: "john@email.com", password: "loremipsum")
jane = User.create!(first_name: "Jane", last_name: "Smithe", email: "jane@email.edu", password: "hipsterimpsum")

Color.create!(hex_code: "#5b756c", nickname: "Aqua Smoke", user: admin)
Color.create!(hex_code: "#CCAC95", nickname: "Pale", user: john)
Color.create!(hex_code: "#9D7E79", nickname: "distance between", user: jane)

color = Color.first
Review.create!(rating: 2, body: "Boo, this colour is too drab for my standards", color: color, user: admin)
Review.create!(rating: 5, body: "I would paint my whole house this colour, I dream in this Hex!!!", color: color, user: john)
Review.create!(rating: 3, body: "Wonderful, soft smokey blue. A bit too light, but makes a serious punch on screen. I designed my logo with it.", color: color, user: jane)

color = Color.second
Review.create!(rating: 1, body: "YUCK!!!!!", color: color, user: admin)
Review.create!(rating: 5, body: "YAAAAAAS! This color is so chill.", color: color, user: john)
Review.create!(rating: 3, body: "Dope, but not the best.", color: color, user: jane)

color = Color.third
Review.create!(rating: 2, body: "This just makes me sad.", color: color, user: admin)
Review.create!(rating: 3, body: "It’s okay, but I won’t use it too much.", color: color, user: john)
Review.create!(rating: 4, body: "Niiiiice. Used it for a great logo color.", color: color, user: jane)
