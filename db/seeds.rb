# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: 'Clay', email: 'clay@clay.cla', password: 'password')
user1 = User.create(username: 'Seth', email: 'seth@clay.cla', password: 'password')
user2 = User.create(username: 'Colleen', email: 'colleen@clay.cla', password: 'password')
user3 = User.create(username: 'Jeremy', email: 'jeremy@clay.cla', password: 'password')

question1 = user.questions.create(title: 'Goldfish and Skittles', content: 'What to make?')
question2 = user1.questions.create(title: 'Starbursts and Onions', content: 'What to make?')
question3 = user2.questions.create(title: 'Carp and Ketchup', content: 'What to make?')

answer1 = user3.answers.create(content: 'A tasty snack', question_id: question1.id)
answer2 = user3.answers.create(content: 'A super tasty snack', question_id: question2.id)
answer3 = user3.answers.create(content: 'A crazy snack', question_id: question3.id)


