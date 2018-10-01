# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Dates

dates = []

6.times do |t|
  random_year = Random.new.rand(1980..2018) # custom range for years
  random_month =Random.new.rand(1..12)
  dates << Date.new(random_year,random_month)
end



# Institutions
# belongs to nothing

inst1 = Institution.create(institution_name: "University of Maryland")
inst2 = Institution.create(institution_name: "Stanford")
inst3 = Institution.create(institution_name: "Salsbury University")


# Industries
# belongs to nothing

ind1 = Industry.create(field: "Technology")
ind2 = Industry.create(field: "Finance")
ind3 = Industry.create(field: "Food Service")


#User
#belongs to nothing

user1 = User.create(username: "jackbauer", fullname: "bauer jackson",  password:"mUc3m00RsqyRe",password_confirmation:"mUc3m00RsqyRe")

user2 = User.create(username: "magicbrandon1", fullname: "brandon sanderson",  password:"mUc3m00RsqyRe",password_confirmation:"mUc3m00RsqyRe")


#
# user1 = User.create(username: "jackbauer","bauer jackson", password_digest: "power")
# user1 = User.create(username: "jackbauer","bauer jackson", password_digest: "power")

#Company
# belongs to industry
company1 = Company.create(company_name: "Google", size: "large", sector: "public", industry: ind1)
company2 = Company.create(company_name: "Carnegie Mellon SEI", size: "small", sector: "academic", industry: ind2)
company3 = Company.create(company_name: "HEB Grocery", size: "medium", sector: "private", industry: ind3)


# Educations
# belongs to user and institution
edu1 = Education.create(start_date: dates.sample, end_date: dates.sample, institution: inst1, user: user1, degree: "highschool");
edu2 = Education.create(start_date: dates.sample, end_date: dates.sample, institution: inst2, user: user1, degree: "bachelor");
edu3 = Education.create(start_date: dates.sample, end_date: dates.sample, institution: inst3, user: user2, degree: "phd");


desc = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."


#Positions
# belongs to user and company
pos1 = Position.create(title: "street sweeper", description: desc, start_date: dates.sample, end_date: dates.sample, user: user1, company: company1)
pos2 = Position.create(title: "waiter", description: desc, start_date: dates.sample, end_date: dates.sample, user: user1, company: company2)
pos3 = Position.create(title: "it consultant", description: desc, start_date: dates.sample, end_date: dates.sample, user: user2, company: company3)
