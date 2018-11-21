# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FundraisingEvent.destroy_all
user = User.new(email: "k8buxton@hotmail.com", password: "123456", admin: false, lender: false, applicant: true, name: "Kate Buxton", motivation: "Motivation: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", linkedin: "https://www.linkedin.com/in/kate-buxton-hunter-53369780/", job: "Professional Professional", industry: "Tech", agecheck: true, reasons_for_funding: "I spent it all")
user.save!
FundraisingEvent.create(course: "Le Wagon", user_id: user.id, date_from: "04-12-2018", date_until: "01-01-2019", guarantor: "Charlie Brown", payback_from: "04-12-2019", payback_until: "04-12-2020", career_goals: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", loan_length: 3, amount: 6500)
FundraisingEvent.create(course: "Flat Iron", user_id: user.id, date_from: "04-12-2018", date_until: "01-01-2019", guarantor: "Chris Martin", payback_from: "04-12-2019", payback_until: "04-12-2020", career_goals: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", loan_length: 3, amount: 8000)
FundraisingEvent.create(course: "General Assembly", user_id: user.id, date_from: "04-12-2018", date_until: "01-01-2019", guarantor: "Charlie Brown", payback_from: "04-12-2019", payback_until: "04-12-2020", career_goals: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", loan_length: 3, amount: 12000)
FundraisingEvent.create(course: "Makers", user_id: user.id, date_from: "04-12-2019", date_until: "01-01-2020", guarantor: "Snoopy", payback_from: "04-12-2020", payback_until: "04-12-2021", career_goals: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", loan_length: 3, amount: 3000)

