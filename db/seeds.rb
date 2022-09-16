# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Article.destroy_all
User.destroy_all

user1 = User.new(first_name: "Silvia", last_name: "Pasini", email: "silvia@silvia.com", password: "xxxxxxxx")
user1.save!

user2 = User.new(first_name: "Olivier", last_name: "Barthelemy", email: "olivier@olivier.com", password: "xxxxxxxx")
user2.save!

user3 = User.new(first_name: "Alice", last_name: "Daubrée", email: "alice@alice.com", password: "xxxxxxxx")
user3.save!

user4 = User.new(first_name: "Bastien", last_name: "Perez Assael", email: "bastien@bastien.com", password: "xxxxxxxx")
user4.save!


users = [user1, user2, user3, user4]

categories = ["Business", "Culture", "Entertainement", "Politics", "Environment"]


50.times do
  articles = Article.new(title: Faker::Book.title,
              author: Faker::Name.name,
              category: categories.sample,
              content: Faker::Lorem.paragraph(sentence_count: 10),
              url: Faker::Internet.url,
              user: users.sample)
  articles.save!
end
