# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Question.all.destroy_all
5.times do |i|
  question = Question.create(title: "Wymień znane ci kolory #{i}")
    question.answers.create(title: "ZIELONY", points: 10)
    question.answers.create(title: "Czerwony", points: 20)
    question.answers.create(title: "Niebieski", points: 30)
    question.answers.create(title: "Czarny", points: 40)
    question.answers.create(title: "Różowy", points: 50)
    question.answers.create(title: "biały", points: 100)
end
